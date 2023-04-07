import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MetaTextView extends StatelessWidget {
  final String text;
  final MetaStyle? textStyle;
  final TextAlign? textAlign;
  final Map<String,String>? trString;
  const MetaTextView({
    required this.text,
    this.textStyle,
    this.trString,
    this.textAlign = TextAlign.center
  });

  @override
  Widget build(BuildContext context) {

    var textWidget = Text(
        text,
        textAlign: textAlign ,
        style:textStyle!=null ? textStyle!.getStyle() : const MetaStyle(fontSize: 12.0,fontColor: MetaColors.blackColor).getStyle()
    );

    if(trString!=null){
     return textWidget.tr(namedArgs: trString);
    }

    return textWidget.tr();
  }

}

