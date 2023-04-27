import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:wheels_on_service/model/serviceCenterServices_model.dart';
import 'package:wheels_on_service/model/service_center_model.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import '../utils/api.dart';

class ServiceCenterController extends GetxController {
  var loading = false.obs;
  var serviceCenters = <ServiceCenter>[].obs;
  var serviceCenterServices = <ServiceCenterServices>[].obs;
  final AuthService authService = AuthService();

  @override
  void onInit() {
    super.onInit();
    getServiceCenters();
  }

  getServiceCenters() async {
    loading.value = true;
    var url = Uri.parse(GET_SERVICE_CENTER_API);
    var response = await http.get(url);
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        var responseData = jsonResponse['data'];
        for (var i = 0; i < responseData.length; i++) {
          serviceCenters.add(ServiceCenter.fromJson(responseData[i]));
        }
        //showMessage(title: "Success", message: jsonResponse["message"]);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    }
  }

  get(serviceCenterID) async {
    loading.value = true;
    var url = Uri.parse(GET_SERVICE_CENTER_SERVICES_API);
    //var token_ = await authService.getToken();
    var response = await http.post(url, body: {"id": serviceCenterID});
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        var responseData = jsonResponse['data'];
        print(responseData);
        for (var i = 0; i < responseData.length; i++) {
          serviceCenterServices
              .add(ServiceCenterServices.fromJson(responseData[i]));
        }
      } else {
        showMessage(
            message: jsonResponse["message"],
            isSuccess: false,
            title: 'Success');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
