import 'package:flight_booking/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSeatPage extends StatefulWidget {
  const SelectSeatPage({super.key});

  @override
  State<SelectSeatPage> createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
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
      body: Column(
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
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
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Emergency Exit',
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
                        color: const Color.fromARGB(255, 233, 230, 230),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Reserved',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
