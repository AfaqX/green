import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Feature/helper/common_var.dart';
import 'package:green/Screen/metel/Metal_Waste.dart';
import '../../Feature/Common_Widget/Custom_Appbar.dart';
import '../../Feature/Common_Widget/Price_managing.dart';
import '../../Feature/Common_Widget/custom-button.dart';

class metal extends StatefulWidget {
  const metal({super.key});

  @override
  State<metal> createState() => _metalState();
}

int mvalue = 1;
int mprice = 45;
int mtotal = 0;
Appcolor appcolor = Appcolor();

class _metalState extends State<metal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomappBar(name: "Metal")),
      backgroundColor: appcolor.themecolor,
      body: Stack(
        children: [
          Positioned(
              bottom: 100,
              left: 30.w,
              child: Container(
                width: 300.w,
                height: 400.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: appcolor.themewhite),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Select The Weight of \n\t\t\t\t\t\t\t\t\t\tYour Waste",
                      style: TextStyle(color: Colors.green, fontSize: 25.sp),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30.w, top: 20.h),
                          child: Text(
                            "Metal",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.green),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Text(
                            "Income",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.green),
                          ),
                        )
                      ],
                    ),
                    custom_row(valu: mvalue, tota: mtotal),
                    fixheightui,
                    Container(
                        width: 280.w,
                        child: Slider(
                            divisions: 12,
                            min: 1,
                            max: 12,
                            value: mvalue.toDouble(),
                            activeColor: Colors.green,
                            onChanged: (Value) {
                              mvalue = Value.toInt();
                              setState(() {
                                mtotal = mvalue * mprice;
                              });
                            })),
                    fixheightui,
                    custom_button(
                        buttonname: "confirm",
                        color: Colors.green,
                        onPressed: () {
                          Get.to(metal_price());
                        })
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
