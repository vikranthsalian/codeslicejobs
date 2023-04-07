import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaImageView extends StatelessWidget {
  String path;
  double? wd;
  double? ht;
  MetaImageView({super.key, required this.path,this.wd,this.ht});

  @override
  Widget build(BuildContext context) {

    if(wd==0 && ht ==0){
      Image.asset(
          path,
          fit: BoxFit.contain
      );
    }

    return  Image.asset(
        path,
        width: wd!.w,
        height: ht!.h,
        fit: BoxFit.contain
    );
  }

}