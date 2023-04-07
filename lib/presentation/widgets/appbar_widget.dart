import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/presentation/widgets/icon.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final String? title;
  final AppBar? appBar;
  final List<Widget>? widgets;
  final Function? onTap;
  final double height = 50.h;

  BaseAppBar({Key? key, this.title, this.appBar, this.widgets, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MetaTextView(text: '${title}',textStyle: MetaStyle(fontSize: 14, fontColor: MetaColors.blackColor),),
      titleSpacing: 0.0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: MetaIcon(icon: Icons.arrow_back,color: MetaColors.blackColor,onIconPressed: (){
        onTap!();
      }),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}


