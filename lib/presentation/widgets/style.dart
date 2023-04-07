import 'package:codeslicejobs/common/constants/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaStyle extends TextStyle {
 final double fontSize;
 final Color fontColor;
 final String? fontFamily;
 final bool enableUnderline;
 final FontStyle fontStyle;
  const MetaStyle({
    required this.fontSize,
    required this.fontColor,
    this.fontFamily = FontConstants.FONT_REGULAR,
    this.enableUnderline=false,
    this.fontStyle=FontStyle.normal
  });

  TextStyle getStyle(){
    return TextStyle(
        fontSize: fontSize.sp,
        color: fontColor,
        decoration: enableUnderline ? TextDecoration.underline:TextDecoration.none,
        fontFamily: fontFamily,
       // fontStyle: fontStyle
        );
  }

}