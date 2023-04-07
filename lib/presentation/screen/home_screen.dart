import 'package:codeslicejobs/common/constants/asset_constants.dart';
import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/common/constants/flavour_constants.dart';
import 'package:codeslicejobs/common/constants/font_constants.dart';
import 'package:codeslicejobs/presentation/widgets/appbar.dart';
import 'package:codeslicejobs/presentation/widgets/image_view.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_field.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MetaColors.whiteColor,
      body: Container(
        color:MetaColors.primaryColor,
        child:  Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: header(),
        ),
      ),
    );
  }

  Widget header(){
    return Column(
      children: [
        SizedBox(height:40.h),

        ...[
          Container(
            alignment: Alignment.centerLeft,
            child:Container(
              child:MetaTextView(text: "Hi,Orlando Gigs",
                  textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.whiteColor,
                      fontFamily: FontConstants.FONT_REGULAR)),
            ),
          ),
          SizedBox(height:10.h),
          Container(
            alignment: Alignment.centerLeft,
            child:Container(
              child:MetaTextView(text: "Find your dream \njob here!",
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 14.0,fontColor: MetaColors.whiteColor,
                      fontFamily: FontConstants.FONT_BOLD)),
            ),
          ),
          SizedBox(height:25.h),
          Container(
            height: 40,
            child: MetaTextField(
              hintText: "Job Role",

              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
          SizedBox(height:15.h),
          Container(
            height: 40,
            child: MetaTextField(
              hintText: "Job Location",

              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),],

      ],
    );
  }

}