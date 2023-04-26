import 'package:codeslicejobs/common/config/navigator_key.dart';
import 'package:codeslicejobs/common/constants/asset_constants.dart';
import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/common/constants/flavour_constants.dart';
import 'package:codeslicejobs/common/constants/font_constants.dart';
import 'package:codeslicejobs/common/constants/route_constants.dart';
import 'package:codeslicejobs/common/extensions/expanded_ext.dart';
import 'package:codeslicejobs/presentation/widgets/appbar.dart';
import 'package:codeslicejobs/presentation/widgets/column_view.dart';
import 'package:codeslicejobs/presentation/widgets/icon.dart';
import 'package:codeslicejobs/presentation/widgets/image_view.dart';
import 'package:codeslicejobs/presentation/widgets/row_view.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_field.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:codeslicejobs/presentation/widgets/wrap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';


class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MetaAppBar(textTitle:"Message",enableLeading: false,
        actionWidgets: [

        ] ),
      body: Container(
        decoration: BoxDecoration(
          color: MetaColors.greyColor,
        ),

        child: Column(
          children: [
            Expanded(child: body())
          ],
        ),
      ),
    );
  }

  Widget body(){
    return Container(
      color: MetaColors.whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          jobCard( img: FlavourConstants.flavourAssetPath + AssetConstants.logoRound,title: "Codeslice IT Solutions",subtitle: "Okay...do we have a deal",time: "12:23",count: 2),
          Divider(),
          jobCard(img: FlavourConstants.baseImagePath + AssetConstants.google,title: "Google Inc.",subtitle: "Our Reviewer will contact you",time: "16:23",count: 0),
          Divider(),
          jobCard(img:FlavourConstants.baseImagePath +  AssetConstants.instagram,title: "Instagram",subtitle: "Nice working with you",time: "09:23",count: 3),
          Divider(),
          jobCard(img:FlavourConstants.baseImagePath + AssetConstants.facebook,title: "Facebook",subtitle: "This is really epic",time: "19:23",count: 12),
          Divider(),
        ],
      ),
    );
  }

  Widget jobCard({img,title,subtitle,time,int count=0}){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(appNavigatorKey.currentState!.context, RouteConstants.chatPath);
      },
      child: Container(
        alignment: Alignment.topCenter,
        height: 55.h,
        child: ListTile(
          dense: true,
            leading: Container(
                child: MetaImageView(
                    ht: 30,wd: 30,
                    path:img
                )
            ),
            title:  Container(
              child: MetaTextView(
                  text: title,
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 14.0,fontColor: MetaColors.blackColor,
                      fontFamily: FontConstants.FONT_BOLD)
              ),
            ),
            subtitle:MetaTextView(
                text: subtitle,
                textAlign: TextAlign.start,
                textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.blackColor,
                    fontFamily: FontConstants.FONT_REGULAR)
            ),
          trailing:  MetaColumnView(
            children: [
             count!= 0 ? Container(
                alignment: Alignment.center,
                width: 15.w,
                height: 15.w,
                child:  MetaTextView(
                    text: count.toString(),
                    textAlign: TextAlign.start,
                    textStyle: const MetaStyle(fontSize: 8.0,fontColor: MetaColors.whiteColor,
                        fontFamily: FontConstants.FONT_BOLD)
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MetaColors.primaryColor
                ),
              ):Container(
               width: 15.w,
               height: 15.w,
             ),
              SizedBox(height: 5.h,),
              MetaTextView(
                  text: time,
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 10.0,fontColor: MetaColors.greyLightColor,
                      fontFamily: FontConstants.FONT_REGULAR)
              ),
            ],
          ),

        )
      ),
    );
  }

}