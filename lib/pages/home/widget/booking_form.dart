import 'package:flight_booking/constands.dart';
import 'package:flight_booking/pages/flight_list/flight_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  TextEditingController dateInput = TextEditingController();
  String selectedTraveller = '1 Adult';
  String selectedFlightClass = 'Economy';

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.h),
      child: Container(
        height: 335.h,
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.black),
                obscureText: false,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.flight_takeoff,
                  ),
                  labelText: 'From',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                obscureText: false,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.flight_land_sharp,
                  ),
                  labelText: 'To',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 135.w,
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      controller: dateInput,
                      obscureText: false,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.calendar_month_outlined,
                        ),
                        labelText: 'Departure',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0.h, horizontal: 20.0.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        } else {}
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 135.w,
                    child: TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      initialValue: 'Add Return Date',
                      obscureText: false,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.add,
                        ),
                        labelText: 'Return',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0.h, horizontal: 20.0.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 135.w,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Traveller',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0.h,
                          horizontal: 20.0.w,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      value: selectedTraveller,
                      onChanged: (newValue) {
                        setState(() {
                          selectedTraveller = newValue.toString();
                        });
                      },
                      items: ['1 Adult', '2 Adults', '3 Adults', '4 Adults']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 135.w,
                    child: DropdownButtonFormField<String>(
                      value: selectedFlightClass,
                      onChanged: (newValue) {
                        setState(() {
                          selectedFlightClass = newValue.toString();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Class',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0.h,
                          horizontal: 20.0.w,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      items: [
                        'Economy',
                        'Business',
                        'First Class',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(300.w, 40.h),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Get.to(const FlightsPage());
                },
                child: Center(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
