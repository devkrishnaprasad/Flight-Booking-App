import 'package:flight_booking/constands.dart';
import 'package:flight_booking/utils/navbar/controller/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final NavbarController _navbarController = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _navbarController.activeTab.value = 'Home';
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: _navbarController.activeTab.value == 'Home'
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _navbarController.activeTab.value = 'Cart';
                  });
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: _navbarController.activeTab.value == 'Cart'
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _navbarController.activeTab.value = 'Favorite';
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: _navbarController.activeTab.value == 'Favorite'
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _navbarController.activeTab.value = 'Profile';
                  });
                },
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: _navbarController.activeTab.value == 'Profile'
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
