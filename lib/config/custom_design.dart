import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomeStyling {

  TextStyle customContenttextBlack({required double opecity}){
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12.0.sp,
      fontWeight: FontWeight.bold,
      color:  Color(0x73000000).withOpacity(0.5),
    );
  }

  TextStyle customContenttextWhite({required double opecity}){
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12.0.sp,
      fontWeight: FontWeight.bold,
      color:  Color(0xFFFAFAFA).withOpacity(opecity),
    );
  }

}