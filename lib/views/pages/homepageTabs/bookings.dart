import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/booking_controller.dart';
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/booking_component.dart';
import 'package:wheels_on_service/views/pages/payment/cart_page.dart';

class BookingPage extends StatelessWidget {
  final BookingController _bookingController = Get.put(BookingController());
  CartController cartController = Get.put(CartController());

  BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    _bookingController.bookings();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bookings"),
          backgroundColor: primaryColor,
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Container(
            //     child: Icon(Icons.notifications),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.only(right: 30),
              child: InkWell(
                onTap: () => Get.to(() => CartPage()),
                child: Badge(
                  badgeContent: Obx(() => SizedBox(
                          child: Text(
                        cartController.cart.length.toString(),
                        style: const TextStyle(color: Colors.white),
                      ))),
                  child: const Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ],
        ),
        body: Obx(() {
          // Check the loading value in the controller
          if (_bookingController.loading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final bookings = _bookingController.bookingsList;
            return ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return BookingComponent(bookings: booking, number: index + 1);
              },
            );
          }
        }));
  }
}
