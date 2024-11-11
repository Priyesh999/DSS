import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../db/preference_handler.dart';
import '../../utils/api_urls.dart';
import 'dashboard_model.dart';
import 'library_repository.dart';

class DashboardController extends GetxController{

  RxInt currentPageIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxString token = "".obs;

  RxString titleStr="".obs;
  RxInt id=0.obs;


  final Rx<PageController> pageController = PageController(
    initialPage: 0,
    keepPage: false,
  ).obs;

  int? c = 100;
  RxList<Widget> rows = List<Widget>.empty(growable: true).obs;
  RxList<DashboardDataModel> apiDataList = List<DashboardDataModel>.empty(growable: true).obs;
  late RxList<PRChartData> dataList = List<PRChartData>.empty(growable: true).obs;
  RxList<PRLineChartData> lineChartData = List<PRLineChartData>.empty(growable: true).obs;
  RxList<PRPieChartData> piechartData = List<PRPieChartData>.empty(growable: true).obs;

  @override
  void onInit() async {
    token.value = (await prefHandler.getLoginToken())!;
    isLoading.value = false;
    super.onInit();
  }



  Future<void> dashboardData() async {
    try {
      isLoading.value = true;
      String? token = await prefHandler.getLoginToken();
      await DashboardRepo().callApi(
          urlStr: ApiUrls.dashboard_data,
          data: {"PR_TOKEN": token},
          beforeSend: () {},
          onSuccess: (data) {
            if (data.isSuccess) {
              apiDataList.value = data.resObject!;
              dataList.value = List.generate(
                apiDataList.value[0].prBarChartData!.prMonthlyData!.length,
                    (index) {
                  return PRChartData(
                      year: apiDataList.value[0].prBarChartData!.prMonthlyData![index].prMonth!,
                      orders: apiDataList.value[0].prBarChartData!.prMonthlyData![index].prOrders!.toDouble(),
                      pending: apiDataList.value[0].prBarChartData!.prMonthlyData![index].prPending!.toDouble(),
                      completed: apiDataList.value[0].prBarChartData!.prMonthlyData![index].prComplete!.toDouble());
                },
              );
              lineChartData.value = List.generate(
                apiDataList.value[0].prLineChartData!.length,
                    (index) {
                  return PRLineChartData(
                      agents: apiDataList.value[0].prLineChartData![index].prAgents!.toDouble(),
                      months: apiDataList.value[0].prLineChartData![index].prMonth!,
                      parties: apiDataList.value[0].prLineChartData![index].prParies!.toDouble());
                },
              );
              piechartData.value = List.generate(
                apiDataList.value[0].prPieChartData!.length,
                    (index) {
                  return PRPieChartData(
                      apiDataList.value[0].prPieChartData![index].prCategory!,
                      apiDataList.value[0].prPieChartData![index].prValue!.toDouble(),
                      Color(int.parse(apiDataList.value[0].prPieChartData![index].prColor!)));
                },
              );

              RxList<PrAllDatum> cardData = List<PrAllDatum>.empty(growable: true).obs;
              for (int i = 0; i < apiDataList.value[0].prAllData!.length; i++) {
                if (apiDataList.value[0].prAllData![i].prIsActive!)
                  cardData.value.add(apiDataList.value[0].prAllData![i]);
              }
              for (int i = 0; i < cardData.value.length; i += 2) {
                List<Widget> rowItems = [];
                for (int j = i; j < i + 2 && j < cardData.value.length; j++) {
                  var name = cardData.value[j].prTitle!;
                  rowItems.add(Expanded(
                      flex: 2,
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: name == 'Agents'
                                  ? Colors.green.shade300
                                  : name == 'Customers'
                                  ? Colors.indigoAccent.shade100
                                  : name == 'Orders'
                                  ? Colors.deepPurple.shade200
                                  : name == 'Pending'
                                  ? Colors.orange.shade200
                                  : name == 'Approved'
                                  ? Colors.lightBlue.shade200
                                  : name == 'Dispatch'
                                  ? Colors.pink.shade200
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Obx(() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(cardData.value[j].prTitle!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70, height: 1)),
                              Text(cardData.value[j].prValue!.toString(),
                                  style: const TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, height: 1))
                            ])),
                            Icon(
                                name == 'Agents'
                                    ? Icons.person
                                    : name == 'Customers'
                                    ? Icons.person
                                    : name == 'Orders'
                                    ? Icons.add_shopping_cart
                                    : name == 'Pending'
                                    ? Icons.delivery_dining
                                    : name == 'Approved'
                                    ? Icons.timelapse_outlined
                                    : name == 'Dispatch'
                                    ? Icons.delivery_dining
                                    : Icons.person,
                                color: Colors.white,
                                size: 28)
                          ]))));
                  if (cardData.value.length % 2 != 0 && j == (cardData.value.length - 1)) {
                    rowItems.add(const Expanded(flex: 2, child: SizedBox.shrink()));
                  }
                }
                rows.value.add(Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: rowItems));
              }
              isLoading.value = false;
            }
          },
          onError: (e) {
            print(e);
            isLoading.value = false;
          });
    } catch (e) {
      isLoading.value = false;
    }
  }

  RxString chartLabel = "Current Years Record".obs;
  RxInt chartbtn = 0.obs;

  void monthly() {
    chartLabel.value = "Current Year Record";
    chartbtn.value = 0;
    dataList.value = List.empty(growable: true);
    apiDataList.value[0].prBarChartData!.prMonthlyData!.forEach((v) {
      return dataList.value.add(PRChartData(
          year: v.prMonth!,
          orders: v.prOrders!.toDouble(),
          pending: v.prPending!.toDouble(),
          completed: v.prComplete!.toDouble()));
    });
  }

  void day() {
    chartLabel.value = "Current Month Record";
    chartbtn.value = 1;
    dataList.value = List.empty(growable: true);
    apiDataList
        .value[0].prBarChartData!.prMonthlyData![apiDataList.value[0].prBarChartData!.prMonthlyData!.length - 1].prDays!
        .forEach((v) {
      return dataList.value.add(PRChartData(
        year: v.prDate!.day.toString(),
        orders: v.prOrders!.toDouble(),
        pending: v.prPending!.toDouble(),
        completed: v.prComplete!.toDouble(),
      ));
    });
  }
}



class PRChartData {
  PRChartData({required this.year, required this.orders, required this.pending, required this.completed});

  final String year;
  final double orders;
  final double pending;
  final double completed;
}

class PRLineChartData {
  PRLineChartData({required this.months, required this.agents, required this.parties});

  final String months;
  final double agents;
  final double parties;
}

class PRPieChartData {
  PRPieChartData(this.category, this.value, this.color);

  final String category;
  final double value;
  final Color color;
}

class PRCardColor {
  String name;
  Color color;

  PRCardColor({required this.name, required this.color});
}