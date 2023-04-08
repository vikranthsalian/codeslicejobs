import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaWrapView extends StatelessWidget {
  WrapAlignment wrapAlignment;
  List<Widget> children;
  MetaWrapView(
      {
        this.wrapAlignment=WrapAlignment.center,
        required this.children
      });

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 10.w,
      alignment: wrapAlignment,
      children: children,
    );

  }

}