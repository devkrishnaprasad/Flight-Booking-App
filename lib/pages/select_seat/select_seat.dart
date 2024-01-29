import 'dart:math';

import 'package:flight_booking/pages/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flight_booking/constands.dart';
import 'package:flight_booking/pages/select_seat/widget/seat_card.dart';
import 'package:get/get.dart';

class SelectSeatPage extends StatefulWidget {
  const SelectSeatPage({super.key});

  @override
  State<SelectSeatPage> createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  var seatType = ['free', 'not_free'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose Seat",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 25.h),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(primaryColor),
            minimumSize: MaterialStateProperty.all(Size(320.0.w, 50.0.h)),
          ),
          onPressed: () {
            Get.to(const PaymentPage());
          },
          child: const Text(
            'Confirm',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10.h,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      'Selected',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 10.h,
                      height: 10.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      'Booked',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 10.h,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 233, 230, 230),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      'Free',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return SeatCard(
                              type:
                                  Random().nextInt(seatType.length).toString(),
                              seatNumber: (index + 1).toString(),
                              seatName: 'A',
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 40.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return SeatCard(
                              type: 'free',
                              seatNumber: (index + 1).toString(),
                              seatName: 'B',
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      SizedBox(
                        width: 40.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return SeatCard(
                              type: 'free',
                              seatNumber: (index + 1).toString(),
                              seatName: 'C',
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 40.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return SeatCard(
                              type: 'free',
                              seatNumber: (index + 1).toString(),
                              seatName: 'D',
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
