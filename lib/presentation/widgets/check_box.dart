import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaCheckBox extends StatefulWidget {

  Function(bool)? onCheckPressed;
  bool? value;

  MetaCheckBox({
    this.onCheckPressed,
    this.value = false,
  });

  @override
  State<StatefulWidget> createState() => _MetaCheckBoxState();
}

class _MetaCheckBoxState extends State<MetaCheckBox> {


  @override
  Widget build(BuildContext context) {


    return Container(
        child:Checkbox(
            value: widget.value!,
            checkColor: Color(MetaColors.primary_color),
            activeColor: Color(MetaColors.primary_color).withOpacity(0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onChanged:(bool? newValue)
            {
              setState(() {
                widget.value = newValue;
              });
              widget.onCheckPressed!(newValue!);

            }
        ));
  }

}

class MetaCheckBoxBloc extends StatelessWidget {
  BooleanFieldBloc? bloc;
  Function(bool)? onSwitchPressed;

  MetaCheckBoxBloc({
    required this.onSwitchPressed,
    this.bloc,
  });
  @override
  Widget build(BuildContext context) {


    bloc!.stream.listen((event) {
      onSwitchPressed!(event.value);
    });

    return Container(
      child: CheckboxFieldBlocBuilder(
          booleanFieldBloc: bloc!,

          // /body: Container(),
          body:Container(
            width: 20.w,
            height: 20.w,
            child: Checkbox(
                value: bloc!.value,
                activeColor: Colors.green,
                onChanged:(bool? newValue){

                  bloc!.updateValue(newValue!);

                }

            ),
          )),
    );


  }

}