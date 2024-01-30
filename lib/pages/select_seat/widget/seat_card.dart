import 'package:flight_booking/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeatCard extends StatefulWidget {
  final String type;
  final String seatNumber;
  final String seatName;

  const SeatCard({
    Key? key,
    required this.type,
    required this.seatNumber,
    required this.seatName,
  }) : super(key: key);

  @override
  State<SeatCard> createState() => _SeatCardState();
}

class _SeatCardState extends State<SeatCard> {
  static int selectedSeatCount = 0;

  bool isSelected = false;
  @override
  void dispose() {
    selectedSeatCount = 0;
    isSelected = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: () {
          if (widget.type != '0') {
            if (isSelected) {
              setState(() {
                isSelected = false;
                selectedSeatCount--;
              });
            } else if (selectedSeatCount < 4) {
              setState(() {
                isSelected = true;
                selectedSeatCount++;
              });
            }
          }
        },
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.green
                : widget.type == '1'
                    ? Colors.white
                    : primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '${widget.seatNumber} ${widget.seatName}',
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : widget.type == '1'
                        ? Colors.black
                        : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
