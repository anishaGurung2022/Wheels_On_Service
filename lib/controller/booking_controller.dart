import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wheels_on_service/model/booking_details_model.dart';
import 'package:wheels_on_service/model/bookings_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:wheels_on_service/views/pages/payment/khalti.dart';

class BookingController extends GetxController {
  var loading = false.obs;
  final AuthService authService = AuthService();
  var bookingID = "".obs;
  var bookings = <Bookings>[].obs;
  var bookingDetails = <BookingDetails>[].obs;
  List<Bookings> get bookingsList => bookings.toList();
  List<BookingDetails> get bookingDetailsList => bookingDetails.toList();

  @override
  void onInit() async {
    super.onInit();
    var token_ = await authService.getToken();
    get(token_);
  }

  place(data) async {
    //var token_ = await authService.getToken();
    //data["token"] = token_;
    var url = Uri.parse(ADD_BOOKING_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      print(data);
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        bookingID.value = jsonResponse["booking_id"].toString();
        print(bookingID.value);
        Get.to(() => KhaltiExampleApp());
        showMessage(
            message: "Service Booked", isSuccess: true, title: 'Success');
      } else {
        showMessage(
            message: jsonResponse["message"], isSuccess: false, title: 'Error');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  addPayment(data) async {
    var url = Uri.parse(ADD_PAYMENT_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      print(data);
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        // showMessage(
        //     message: jsonResponse["message"],
        //     isSuccess: true,
        //     title: 'Success');
      } else {
        showMessage(
            message: jsonResponse["message"], isSuccess: false, title: 'Error');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  get(token_) async {
    loading.value = true;
    var url = Uri.parse(GET_BOOKINGS_API);
    var response = await http.post(url, body: {"token": token_});
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        var responseData = jsonResponse['data'];
        for (var i = 0; i < responseData.length; i++) {
          bookings.add(Bookings.fromJson(responseData[i]));
        }
        print(jsonResponse);
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

  getBookingDetails(id) async {
    loading.value = true;
    var url = Uri.parse(GET_BOOKING_DETAILS_API);
    var response = await http.post(url, body: {"id": id});
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        var responseData = jsonResponse['data'];
        for (var i = 0; i < responseData.length; i++) {
          bookingDetails.add(BookingDetails.fromJson(responseData[i]));
        }
        print(responseData);
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
