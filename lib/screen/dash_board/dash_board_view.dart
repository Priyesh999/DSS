import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../utils/app_color.dart';
import 'dash_board_controller.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return DashboardViewState();
  }
}

class DashboardViewState extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? Center(child: CircularProgressIndicator(color: AppColor.primary))
        : ListView(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Column(children: controller.rows.value.length == 0 ? [] : controller.rows.value)),
      Obx(() => Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(6)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(controller.chartLabel.value,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.monthly();
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: controller.chartbtn.value == 0 ? Colors.red.shade900 : Colors.white),
                          child: Text("MONTHS",
                              style: TextStyle(
                                  color: controller.chartbtn.value == 0 ? Colors.white : Colors.black,
                                  fontSize: 12)))),
                  const SizedBox(width: 6),
                  GestureDetector(
                      onTap: () {
                        controller.day();
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: controller.chartbtn.value == 1 ? Colors.red.shade900 : Colors.white),
                          child: Text("DAYS",
                              style: TextStyle(
                                  color: controller.chartbtn.value == 1 ? Colors.white : Colors.black,
                                  fontSize: 12)))),
                ],
              )
            ]),
            const SizedBox(height: 12),
            Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              selectionGesture: ActivationMode.singleTap,
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enablePanning: true,
                enableDoubleTapZooming: true,
                enableMouseWheelZooming: true,
              ),
              tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x : point.y'),
              series: <ColumnSeries<PRChartData, String>>[
                ColumnSeries<PRChartData, String>(
                  name: 'Orders',
                  dataSource: controller.dataList.value,
                  xValueMapper: (PRChartData data, _) => data.year,
                  yValueMapper: (PRChartData data, _) => data.orders,
                  color: Colors.deepPurple.shade200,
                  // dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                ),
                ColumnSeries<PRChartData, String>(
                  name: 'Pending',
                  dataSource: controller.dataList.value,
                  xValueMapper: (PRChartData data, _) => data.year,
                  yValueMapper: (PRChartData data, _) => data.pending,
                  color: Colors.lightBlue.shade200,
                  // dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                ),
                ColumnSeries<PRChartData, String>(
                  name: 'Completed',
                  dataSource: controller.dataList.value,
                  xValueMapper: (PRChartData data, _) => data.year,
                  yValueMapper: (PRChartData data, _) => data.completed,
                  color: Colors.pink.shade200,
                  // dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                )
              ],
            ))
          ]))),
      Container(
        margin: const EdgeInsets.all(12),
        // padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Agents',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade300,
                        ),
                      ),
                      const TextSpan(
                        text: ' & ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Default color
                        ),
                      ),
                      TextSpan(
                        text: 'Parties Chart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade300,
                        ),
                      ),
                    ],
                  ),
                )),
            SfCartesianChart(
                primaryXAxis: const CategoryAxis(),
                selectionGesture: ActivationMode.singleTap,
                zoomPanBehavior: ZoomPanBehavior(
                  enablePinching: true,
                  enablePanning: true,
                  enableDoubleTapZooming: true,
                  enableMouseWheelZooming: true,
                ),
                tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x : point.y'),
                series: <LineSeries<PRLineChartData, String>>[
                  LineSeries<PRLineChartData, String>(
                      name: 'Agents',
                      dataSource: controller.lineChartData.value,
                      xValueMapper: (PRLineChartData data, _) => data.months,
                      yValueMapper: (PRLineChartData data, _) => data.agents,
                      color: Colors.red.shade300,
                      enableTooltip: true),
                  LineSeries<PRLineChartData, String>(
                      name: 'Parties',
                      dataSource: controller.lineChartData.value,
                      xValueMapper: (PRLineChartData data, _) => data.months,
                      yValueMapper: (PRLineChartData data, _) => data.parties,
                      color: Colors.deepPurple.shade300,
                      enableTooltip: true),
                ])
          ],
        ),
      ),
      controller.apiDataList.value[0].prPieChartData!.length == 0
          ? SizedBox.shrink()
          : Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(6)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(padding: EdgeInsets.all(16), child: Text("")),
            SfCircularChart(
              title: const ChartTitle(text: 'Books Data'),
              legend: const Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x : point.y'),
              series: <PieSeries<PRPieChartData, String>>[
                PieSeries<PRPieChartData, String>(
                  dataSource: controller.piechartData.value,
                  xValueMapper: (PRPieChartData data, _) => data.category,
                  yValueMapper: (PRPieChartData data, _) => data.value,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ])),
    ]));
  }
}
