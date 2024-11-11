
import '../../../../cbt_api/cbt_api.dart';
import '../../model/response.dart';
import 'dashboard_model.dart';


class DashboardRepo{
  List<DashboardDataModel> dataList = List.empty(growable: true);
  Future<void> callApi({
    required String urlStr,
    required Map<String, dynamic> data,
    required Function() beforeSend,
    required Function(ApiResponse<List<DashboardDataModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    CbtRequest(url: urlStr, data: data).postRequest(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onSuccess: (data) {
          try {
            if (data["STATUS"] == "SUCCESS") {
              if(data["DATA"] != null){
                data["DATA"].forEach((v){
                  dataList.add(DashboardDataModel.fromJson(v));
                });
              }
            }
          } catch (e) {}
          onSuccess(ApiResponse(
              resObject: dataList,
              isSuccess: (data["STATUS"] == "SUCCESS"),
              errorCause: data['MESSAGE'] ?? ""));
        },
        onError: onError);
  }
}