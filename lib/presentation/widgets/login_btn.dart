import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';


class BaseButton extends StatefulWidget {
  const BaseButton(
      {Key? key,
        required this.onTap,this.label,required this.set_padding,required this.ButtonBackgroundColor,required this.ButtonBorderColor,required this.style})
      : super(key: key);
  final Function onTap;
  final String? label;
  final EdgeInsetsDirectional? set_padding;
  final Color? ButtonBackgroundColor;
  final Color? ButtonBorderColor;
  final MetaStyle? style;

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:widget.set_padding!,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: widget.ButtonBorderColor!)
              // <-- Radius
            ),
            minimumSize: const Size(double.infinity, 60),
            backgroundColor: widget.ButtonBackgroundColor),
        onPressed: () {
          widget.onTap();
        },
        child: MetaTextView(text:widget.label!,
          textStyle: widget.style,
        ),
      ),
    );
  }
}