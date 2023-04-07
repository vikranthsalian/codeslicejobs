import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MetaIcon extends StatelessWidget {

  Function()? onIconPressed;
  double size;
  Color color;
  IconData icon;
  Color bgColor;
  double padding;

  MetaIcon({super.key,
     this.onIconPressed ,
    required this.icon,
    this.color = MetaColors.whiteColor,
    this.size =  25.0,
    this.padding =  10,
    this.bgColor =  Colors. transparent,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onIconPressed!();
    },
      child:  Container(
        width: size.r+padding,
        height: size.r+padding,
        decoration: BoxDecoration(
            color: bgColor,
          shape: BoxShape.circle
        ),
        child: Container(
          child: Icon(
              icon,
              color: color,
              size: size.r),
        ),
      ),
    );
  }

}
