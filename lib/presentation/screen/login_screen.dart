import 'package:codeslicejobs/common/constants/asset_constants.dart';
import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/common/constants/flavour_constants.dart';
import 'package:codeslicejobs/common/constants/font_constants.dart';
import 'package:codeslicejobs/presentation/widgets/image_view.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MetaColors.whiteColor,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Container(
                child: MetaImageView(path: FlavourConstants.flavourAssetPath+AssetConstants.logoRound,wd: 100,ht: 100)
            ),
            SizedBox(height: 20.h),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30.w),
              child: MetaTextView(text: "Hey there,",
                textStyle: MetaStyle(fontSize: 20.0,fontColor: MetaColors.blackColor,fontFamily: FontConstants.FONT_EXTRA_BOLD),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30.w),
              child: MetaTextView(text: "Welcome!!!",
                textStyle: MetaStyle(fontSize: 20.0,fontColor: MetaColors.blackColor,fontFamily: FontConstants.FONT_EXTRA_BOLD),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30.w),
              child: MetaTextView(text: "Login to your account to continue",
                textAlign: TextAlign.start,
                textStyle: MetaStyle(fontSize: 15.0,fontColor: MetaColors.blackColor,fontFamily: FontConstants.FONT_BOLD),
              ),
            ),
            SizedBox(height: 20.h),
            socialButtonRect(
                'Login with Facebook', MetaColors().facebookColor, FontAwesomeIcons.facebookF,
                onTap: () {

                }),
            socialButtonRect(
                'Login with Google', MetaColors().googleColor, FontAwesomeIcons.googlePlusG,
                onTap: () {

                }),
            socialButtonRect(
                'Login with LinkedIn', MetaColors().linkedinColor, FontAwesomeIcons.linkedinIn,
                onTap: () {

                }),
            socialButtonRect(
                'Login with Github', MetaColors().githubColor, FontAwesomeIcons.github,
                onTap: () {

                }),
          ],
        ),
      ),
    );
  }

   socialButtonRect(title, color, icon, {Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: MetaTextView(text: title,
                textStyle: MetaStyle(fontSize: 12.0,fontColor: MetaColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}