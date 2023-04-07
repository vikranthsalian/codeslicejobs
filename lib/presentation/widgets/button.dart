import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MetaButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final MetaStyle textStyle;
  final Color bgColor;
  final String buttonType;
  final bool isElevated;
  const MetaButton(
      {Key? key,
        required this.onTap,
        required this.text,
        required this.textStyle,
        this.bgColor = MetaColors.primaryColor,
        this.buttonType = "normal",
        this.isElevated = true,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isElevated ? ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r), // <-- Radius
            ),
            minimumSize:  Size(double.infinity, 50.h),
            backgroundColor: bgColor),
        onPressed: () {
          onTap();
        },
        child: textView()
      ):TextButton(
        style: TextButton.styleFrom(
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r), // <-- Radius
            ),
            minimumSize:  Size(double.infinity, 50.h),
            backgroundColor: bgColor),
            onPressed: () {
              onTap();
            },
          child: textView()
      ),
    );
  }

  Widget textView(){
    return MetaTextView(text: text,textStyle: textStyle);
  }


}

