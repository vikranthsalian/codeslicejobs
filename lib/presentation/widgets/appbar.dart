import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/common/constants/font_constants.dart';
import 'package:codeslicejobs/presentation/widgets/icon.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class MetaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color bgColor;
  final String? textTitle;
  final List<Widget>? widgets;
  final double height = 40.h;
  final Function? onPressed;
  final bool enableLeading;
  final bool centerTitle;
  final Widget? leading;
  List<Widget>  actionWidgets;
  MetaAppBar({ this.textTitle,this.centerTitle=true,this.leading,this.bgColor = MetaColors.primaryColor,this.actionWidgets=const [], this.widgets, this.onPressed,this.enableLeading=true});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      toolbarHeight: height,
      leadingWidth: !enableLeading ? 10.w: 45.w,
      automaticallyImplyLeading: enableLeading,
      title:MetaTextView(text: textTitle!,textStyle: const MetaStyle(fontSize: 16.0,fontColor: MetaColors.whiteColor,fontFamily: FontConstants.FONT_BOLD)),
      leading: enableLeading ? getLeading():SizedBox(),
      actions: actionWidgets,
      centerTitle: centerTitle,
      // MetaImageView(path: "${MetaFlavourConstants.cric8BaseImageAsset}app_back.png",)
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  getLeading() {

    if(leading!=null){
      return leading;
    }
    return MetaIcon(icon: LineIcons.arrowLeft,color: MetaColors.whiteColor,onIconPressed: (){
      onPressed!();
    });

  }
}


