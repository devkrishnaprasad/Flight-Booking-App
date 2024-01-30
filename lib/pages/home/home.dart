import 'package:flight_booking/constands.dart';
import 'package:flight_booking/pages/home/widget/booking_form.dart';
import 'package:flight_booking/pages/home/widget/offer_card.dart';
import 'package:flight_booking/utils/navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController fromTextController =
      TextEditingController(text: 'Economy');
  TextEditingController toTextController =
      TextEditingController(text: 'Economy');
  TextEditingController dateController = TextEditingController(text: 'Economy');
  TextEditingController passengerCountController =
      TextEditingController(text: 'Economy');
  TextEditingController classCountController =
      TextEditingController(text: 'Economy');

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Text(
                "Book Flight",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 25.dg,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Container(
                  width: 302.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ToggleSwitch(
                    minWidth: 100.w,
                    minHeight: 30.h,
                    cornerRadius: 20,
                    inactiveBgColor: Colors.white,
                    radiusStyle: true,
                    initialLabelIndex: 0,
                    totalSwitches: 3,
                    centerText: true,
                    inactiveFgColor: Colors.grey,
                    labels: const ['One way', 'Round', 'Multicity'],
                    onToggle: (index) {},
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const BookingForm(),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Divider(
                  height: 20.h,
                  thickness: 1.0,
                  color: const Color.fromARGB(255, 225, 221, 221),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hot offer',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 120.0.h, // Provide a fixed height
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const OfferCard();
                  },
                ),
              ),
              SizedBox(
                height: 70.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
