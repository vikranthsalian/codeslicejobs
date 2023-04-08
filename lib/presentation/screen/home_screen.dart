import 'package:codeslicejobs/common/config/navigator_key.dart';
import 'package:codeslicejobs/common/constants/asset_constants.dart';
import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/common/constants/flavour_constants.dart';
import 'package:codeslicejobs/common/constants/font_constants.dart';
import 'package:codeslicejobs/common/constants/route_constants.dart';
import 'package:codeslicejobs/common/extensions/expanded_ext.dart';
import 'package:codeslicejobs/presentation/widgets/column_view.dart';
import 'package:codeslicejobs/presentation/widgets/icon.dart';
import 'package:codeslicejobs/presentation/widgets/image_view.dart';
import 'package:codeslicejobs/presentation/widgets/row_view.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_field.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:codeslicejobs/presentation/widgets/wrap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            header(),
            Expanded(child: body())
          ],
        ),
      ),
    );
  }

  Widget header(){
    return Container(
      decoration: BoxDecoration(
        color:MetaColors.primaryColor,
        borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r)
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),

      child: Column(
        children: [
           SizedBox(height:40.h),
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
            SizedBox(height:15.h),
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
            ),
            SizedBox(height:10.h),
        ],
      ),
    );
  }

  Widget body(){
    return Container(
      color: MetaColors.greyColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height:5.h),
          jobCard(),
          jobCard(),
        ],
      ),
    );
  }

  Widget jobCard(){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(appNavigatorKey.currentState!.context, RouteConstants.detailPath);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
        decoration: BoxDecoration(
          color:MetaColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r))
        ),
        child: MetaColumnView(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MetaRowView(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: MetaImageView(
                        ht: 40,wd: 40,
                        path: FlavourConstants.flavourAssetPath + AssetConstants.logoRound
                    )
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child:MetaIcon(
                  icon: LineIcons.bookmark,
                  color: MetaColors.primaryColor,
                ),
              )
            ].expandedEqually().toList()),

            Container(
              child: MetaTextView(
                  text: "UI/UX Designer",
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 14.0,fontColor: MetaColors.blackColor,
                      fontFamily: FontConstants.FONT_BOLD)
              ),
            ),
            Container(
              child: MetaTextView(
                  text: "Google inc"+" . "+"California, USA",
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.blackColor,
                      fontFamily: FontConstants.FONT_REGULAR)
              ),
            ),
            SizedBox(height: 10.h,),
            MetaWrapView(children: [
              keys("Design"),
              keys("Full time"),
              keys("Senior designer")
            ],),
            SizedBox(height: 5.h,),
            MetaRowView(children: [
              Container(
                child: MetaTextView(
                    text: "25 minute ago",
                    textAlign: TextAlign.start,
                    textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.greyLightColor,
                        fontFamily: FontConstants.FONT_REGULAR)
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child:MetaRowView(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  MetaTextView(
                      text: "\$15K",
                      textAlign: TextAlign.start,
                      textStyle: const MetaStyle(fontSize: 14.0,fontColor: MetaColors.blackColor,
                          fontFamily: FontConstants.FONT_BOLD)
                  ),MetaTextView(
                      text: "/Month",
                      textAlign: TextAlign.start,
                      textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.greyLightColor,
                          fontFamily: FontConstants.FONT_REGULAR)
                  )
                ]),
              )
            ].expandedEqually().toList())
          ]
        ),

      ),
    );
  }
  
  Widget keys(text){
    return Container(
        decoration: BoxDecoration(
            color: MetaColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r))
        ),
      padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
      child: MetaTextView(
            text:text,
            textStyle: const MetaStyle(fontSize: 10.0,fontColor: MetaColors.whiteColor,
                fontFamily: FontConstants.FONT_REGULAR)
        )
    );
    
  }

}