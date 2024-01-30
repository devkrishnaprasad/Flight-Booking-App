import 'package:flight_booking/constands.dart';
import 'package:flight_booking/pages/payment/card_components/card_view.dart';
import 'package:flight_booking/pages/tickets/tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    // Set the default selected radio button.
    selectedRadio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.h,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 10.w),
              child: Container(
                height: 170.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 5.w, top: 10.h, right: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Image.asset(
                              'assets/icons/indio_ic.jpeg',
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_month_outlined),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '30/01/2024',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '5:50',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              const Text(
                                'DEL (Delhi)',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomPaint(
                                painter: LineWithCirclesPainter(),
                                size: Size(130.w, 20),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      '5:50',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    const Text('DEL (Delhi)',
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Divider(
                        height: 20.h,
                        thickness: 1.0,
                        color: const Color.fromARGB(255, 240, 232, 232),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                          Text(
                            '₹230',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        setSelectedRadio(val!);
                      },
                    ),
                  ),
                  const Text(
                    'Card Payment',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.3,
                    child: Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        setSelectedRadio(val!);
                      },
                    ),
                  ),
                  const Text(
                    'UPI Payment',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: selectedRadio == 1
                    ? const CardViewWidget()
                    : Column(
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: 'UPI ID',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                hintText: "UPI ID",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.0.w, horizontal: 10.0.h),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0.w),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
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
                Get.to(
                  const TicketsPage(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              child: const Text(
                'Confirm',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: primaryColor, width: 1.0),
                ),
                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(320.0.w, 50.0.h)),
              ),
              onPressed: () {},
              child: Text(
                'Cancel',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LineWithCirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    Paint circlePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    double lineLength = size.width - 20; // Adjust the length accordingly
    double circleRadius = 5;

    // Draw the line
    canvas.drawLine(
      Offset(10, size.height / 2),
      Offset(10 + lineLength, size.height / 2),
      linePaint,
    );

    // Draw circles at both ends
    canvas.drawCircle(
      Offset(10, size.height / 2),
      circleRadius,
      circlePaint,
    );

    canvas.drawCircle(
      Offset(10 + lineLength, size.height / 2),
      circleRadius,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
