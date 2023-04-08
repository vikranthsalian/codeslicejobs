import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaColumnView extends StatelessWidget {
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;
  List<Widget> children;
  MetaColumnView(
      {
        this.crossAxisAlignment=CrossAxisAlignment.center,
        this.mainAxisAlignment=MainAxisAlignment.center,
        required this.children
      });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );

  }

}