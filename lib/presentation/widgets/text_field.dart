import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/common/constants/font_constants.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaTextField extends StatelessWidget {
  MetaTextField({Key? key,
    required this.controller,
    this.maxLength,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onValidate,
    this.suffixIcon,
    this.textStyling,
    this.labelStyling,
    this.backgroundColor,
    this.borderColor=MetaColors.transparentColor,
    this.errorColor=MetaColors.redColor,
    this.inputType = TextInputType.text,
    this.enabled = true,
    this.inputFormatters,
    this.hintStyle,
    this.isPassword = false,
    this.borderRadius = 8,
    this.maxLines,
    this.readOnly = false,
  })
      : super(key: key);
  String? labelText;
  TextEditingController? controller;
  String? hintText;
  int? maxLength;
  Function(String)? onChanged;
  FormFieldValidator<String>? onValidate;
  Widget? suffixIcon;
  TextStyle? textStyling;
  TextStyle? labelStyling;
  Color? backgroundColor;
  Color? borderColor;
  Color? errorColor;
  TextInputType inputType;
  bool enabled;
  bool readOnly;
  TextAlign? textAlign;
  List<TextInputFormatter>? inputFormatters;
  TextStyle? hintStyle;
  bool isPassword;
  final double borderRadius;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
      autofocus: false,

      enabled: enabled,
      keyboardType: inputType,
      maxLength: maxLength != 0 ? maxLength : null,
      onChanged: onChanged,
      style: textStyling,
      inputFormatters: inputFormatters,
      maxLines: maxLines ?? 1,
      validator: onValidate,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: _renderBorder(),
        disabledBorder: _renderBorder(),
        focusedBorder: _renderBorder(),
        enabledBorder: _renderBorder(),
        // label:Text(
        //   labelText ?? "",
        //   style: labelStyling,
        // ),
        hintText: hintText,
        hintStyle: hintStyle ,
        filled: true,
        fillColor: backgroundColor,
        errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: errorColor!),
        helperMaxLines: 1,
        suffixIcon: suffixIcon,
      ),
      readOnly: readOnly,
    );
  }

  OutlineInputBorder _renderBorder() =>
      OutlineInputBorder(
        borderRadius:  BorderRadius.circular(12.r),
        borderSide:  BorderSide(color: borderColor!),
      );

}

class MetaBlocTextField extends StatelessWidget {
  MetaBlocTextField({Key? key,
    required this.textFieldBloc,
    this.maxLength,
    this.labelText="",
    this.hintText="",
    this.onChanged,
 //   this.onValidate,
    this.suffixIcon,
    this.backgroundColor = Colors.white,
    this.inputType = TextInputType.text,
    this.enabled = true,
    this.inputFormatters,
    this.isPassword=false,
    this.borderRadius = 8,
    this.maxLines,
    this.readOnly = false,
    this.isEnabled = true,
    this.textStyle = const MetaStyle(fontColor: MetaColors.textFieldTextColor,fontSize: 14,fontFamily: FontConstants.FONT_BOLD),
    this.textColor=  MetaColors.blackColor
  })
      : super(key: key);
  String labelText;
  TextEditingController? controller;
  String hintText;
  int? maxLength;
  Function(String)? onChanged;
 // FormFieldValidator<String>? onValidate;
  Widget? suffixIcon;
  Color? backgroundColor;
  TextInputType inputType;
  bool enabled;
  bool readOnly;
  TextAlign? textAlign;
  List<TextInputFormatter>? inputFormatters;
  bool isPassword;
  bool isEnabled;
  final double borderRadius;
  final int? maxLines;
  TextFieldBloc textFieldBloc;
  TextStyle textStyle;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      key: UniqueKey(),
      textFieldBloc: textFieldBloc,
      keyboardType: inputType,
      maxLength: maxLength != 0 ? maxLength : null,
      onChanged: onChanged,
      textStyle: textStyle,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      textColor: MaterialStateProperty.all<Color>(textColor!),
      maxLines: maxLines ?? 1,
      obscureText: isPassword,
      suffixButton:isPassword ? SuffixButton.obscureText:null,
      isEnabled: isEnabled,
      decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: _renderBorder(MetaColors.textFieldBorderClr),
        disabledBorder: _renderBorder(MetaColors.textFieldBorderClr),
        focusedBorder: _renderBorder(MetaColors.textFieldBorderClr),
        enabledBorder: _renderBorder(MetaColors.textFieldBorderClr),
        focusedErrorBorder: _renderBorder(MetaColors.redColor),
        errorBorder: _renderBorder(MetaColors.redColor),
        label:MetaTextView(text:labelText,textStyle: const MetaStyle(fontColor: MetaColors.labelFieldTextColor,fontSize: 12)),
        hintText: hintText.tr(),
        hintStyle:const MetaStyle(fontColor: MetaColors.labelFieldTextColor,fontSize: 12).getStyle(),
        errorStyle:const MetaStyle(fontColor:MetaColors.redColor,fontSize: 12).getStyle(),
        filled: true,
        fillColor: backgroundColor,
        helperMaxLines: 1,
        suffixIcon: suffixIcon
      ),
      readOnly: readOnly,
    );
  }

  // OutlineInputBorder _renderBorder() =>
  //     OutlineInputBorder(
  //       borderRadius:  BorderRadius.circular(12.r),
  //       borderSide:  BorderSide(color: borderColor!),
  //     );


  UnderlineInputBorder _renderBorder(color) =>
      UnderlineInputBorder(borderSide: BorderSide(color: color));


}
//
// class MetaTextFieldBlocView extends StatelessWidget {
//   MetaTextFieldBlocView({Key? key,
//     this.controller,
//     required this.mapData,
//     required this.onChanged,
//     required this.textFieldBloc,
//   })
//       : super(key: key);
//   Map mapData;
//   TextEditingController? controller;
//   Function(String)? onChanged;
//   TextFieldBloc textFieldBloc;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFieldBlocBuilder(
//       key: UniqueKey(),
//       textFieldBloc: textFieldBloc,
//       //controller:controller,
//       autofocus: false,
//     //  enabled: mapData['enabled'],
//       keyboardType: ParseDataType().getInputType(mapData['inputType'] ?? "") ,
//       maxLength: mapData['maxLength'] ?? null,
//     //  onChanged: onChanged,
//      // suffixButton:mapData['isPassword'] ? SuffixButton.obscureText: SuffixButton.clearText,
//       obscureText: mapData['isPassword']  ?? false,
//       obscureTextTrueIcon: Icon(Icons.remove_red_eye,
//           color: ParseDataType().getHexToColor(FlavourConstants.appThemeData['cursor_color'])),
//       textStyle: MetaStyle(mapData: mapData['text']).getStyle() ,
//       inputFormatters: mapData['inputFormatters']  ?? [],
//       maxLines:  mapData['maxLines'] ?? 1 ,
//      // autovalidateMode: AutovalidateMode.disabled,
//       decoration: InputDecoration(
//         isDense: true,
//
//         contentPadding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//         border: _renderBorder(),
//      // disabledBorder: _renderBorder(),
//         focusedBorder: _renderBorder(),
//         enabledBorder: _renderBorder(),
//         label: MetaTextView(mapData: mapData['labelText']),
//         hintText: mapData['hintText']['text'],
//         hintStyle: MetaStyle(mapData: mapData['hintText']).getStyle() ,
//         filled: true,
//         fillColor:ParseDataType().getHexToColor(mapData['backgroundColor'] ?? "0xFFFFFFFF"),
//         errorStyle: MetaStyle(mapData: mapData['errorText']).getStyle(),
//         suffixIcon: mapData['suffixIcon'] ?? null,
//       ),
//       readOnly: mapData['readOnly'] ?? false,
//       cursorColor:ParseDataType().getHexToColor(FlavourConstants.appThemeData['cursor_color']),
//     );
//   }
//
//   UnderlineInputBorder _renderBorder() =>
//       UnderlineInputBorder(borderSide:BorderSide(color:ParseDataType().getHexToColor(mapData['borderColor'] ?? "0xFFFFFFFF")));
//
// }
//
// class MetaTextFieldView extends StatelessWidget {
//   MetaTextFieldView({Key? key,
//     this.controller,
//     required this.mapData,
//     required this.onChanged,
//   })
//       : super(key: key);
//   Map mapData;
//   TextEditingController? controller;
//   Function(String)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       key: UniqueKey(),
//       controller:controller,
//       autofocus: false,
//       keyboardType: ParseDataType().getInputType(mapData['inputType'] ?? "") ,
//       maxLength: mapData['maxLength'] ?? null,
//       obscureText: mapData['isPassword']  ?? false,
//       style:  MetaStyle(mapData: mapData['text']).getStyle(),
//       inputFormatters: mapData['inputFormatters']  ?? [],
//       maxLines:  mapData['maxLines'] ?? 1 ,
//       decoration: InputDecoration(
//         isDense: true,
//         contentPadding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//         border: _renderBorder(),
//         // disabledBorder: _renderBorder(),
//         focusedBorder: _renderBorder(),
//         enabledBorder: _renderBorder(),
//         label: MetaTextView(mapData: mapData['labelText']),
//         hintText: mapData['hintText']['text'],
//         hintStyle: MetaStyle(mapData: mapData['hintText']).getStyle() ,
//         filled: true,
//         fillColor:ParseDataType().getHexToColor(mapData['backgroundColor'] ?? "0xFFFFFFFF"),
//         errorStyle: MetaStyle(mapData: mapData['errorText']).getStyle(),
//         suffixIcon: mapData['suffixIcon'] ?? null,
//       ),
//       readOnly: mapData['readOnly'] ?? false,
//       cursorColor:ParseDataType().getHexToColor(FlavourConstants.appThemeData['cursor_color']),
//     );
//   }
//
//   UnderlineInputBorder _renderBorder() =>
//       UnderlineInputBorder(borderSide:BorderSide(color:ParseDataType().getHexToColor(mapData['borderColor'] ?? "0xFFFFFFFF")));
//
// }
