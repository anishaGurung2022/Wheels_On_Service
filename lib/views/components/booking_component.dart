// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/booking_controller.dart';
import 'package:wheels_on_service/model/bookings_model.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/booking_details.dart';

class BookingComponent extends StatefulWidget {
  final int number;
  final Bookings bookings;

  BookingComponent({
    Key? key,
    required this.number,
    required this.bookings,
  }) : super(key: key);

  @override
  State<BookingComponent> createState() => _BookingComponentState();
}

class _BookingComponentState extends State<BookingComponent> {
  BookingController bookingController = BookingController();

  @override
  void initState() {
    super.initState();
    bookingController.getBookingDetails(widget.bookings.id);
  }

  @override
  Widget build(BuildContext context) {
    var bookingDetailsList = bookingController.bookingDetailsList;
    return InkWell(
      onTap: () {
        if (bookingDetailsList != null) {
          Get.to(BookingDetailsPage(
              bookingDetailsList: bookingController.bookingDetailsList));
        } else {
          print("Error");
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 270,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(color: Colors.black, width: 0.5),
                    boxShadow: const [BoxShadow()],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, bottom: 0, right: 20, top: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 130, bottom: 0, right: 20, top: 0),
                              child: Text(
                                "#${widget.number}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, bottom: 0, right: 20, top: 10),
                        child: Wrap(
                          children: [
                            const Text(
                              "Service Center Name:",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                            Text(
                              widget.bookings.serviceCenter,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 100, bottom: 0, right: 20, top: 10),
                        child: Row(
                          children: const [
                            Text(
                              "Booking Date and time:",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, bottom: 0, right: 20, top: 10),
                        child: Text(
                          widget.bookings.bookingDate.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 150, bottom: 0, right: 20, top: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Total: ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                            Text(
                              "Rs.${widget.bookings.total}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 100, bottom: 0, right: 20, top: 10),
                      //   child: Row(
                      //     children: [
                      //       const Text(
                      //         "Payment Status: ",
                      //         style: TextStyle(
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.bold,
                      //             color: primaryColor),
                      //       ),
                      //       Text(
                      //         widget.bookings.isPaid.toString() == "1"
                      //             ? 'Paid'
                      //             : 'Unpaid',
                      //         style: const TextStyle(
                      //             fontSize: 14, fontWeight: FontWeight.bold),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 160, bottom: 0, right: 15, top: 30),
                        child: Text(
                          "Click to see booking details",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
