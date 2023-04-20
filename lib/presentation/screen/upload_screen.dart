import 'package:codeslicejobs/common/constants/asset_constants.dart';
import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/common/constants/flavour_constants.dart';
import 'package:codeslicejobs/common/constants/font_constants.dart';
import 'package:codeslicejobs/common/extensions/expanded_ext.dart';
import 'package:codeslicejobs/presentation/components/dotted_border.dart';
import 'package:codeslicejobs/presentation/widgets/appbar.dart';
import 'package:codeslicejobs/presentation/widgets/column_view.dart';
import 'package:codeslicejobs/presentation/widgets/icon.dart';
import 'package:codeslicejobs/presentation/widgets/image_view.dart';
import 'package:codeslicejobs/presentation/widgets/non_exp.dart';
import 'package:codeslicejobs/presentation/widgets/row_view.dart';
import 'package:codeslicejobs/presentation/widgets/style.dart';
import 'package:codeslicejobs/presentation/widgets/text_field.dart';
import 'package:codeslicejobs/presentation/widgets/text_view.dart';
import 'package:codeslicejobs/presentation/widgets/wrap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
enum UploadState { ZERO, ADDED, UPLOADED }

class UploadScreen extends StatelessWidget {

  UploadState uploadState = UploadState.UPLOADED;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar:  uploadState != UploadState.UPLOADED ? Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        color: MetaColors.whiteColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          decoration: BoxDecoration(
              color: MetaColors.primaryColor,
              borderRadius: BorderRadius.circular(10.r)
          ),
          child: MetaTextView(
              text: "Apply Now",
              textStyle: const MetaStyle(fontSize: 20.0,fontColor: MetaColors.whiteColor,
                  fontFamily: FontConstants.FONT_BOLD)
          ),
        ),
      ):Container(height: 0),
      body: Container(
        child: MetaColumnView(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Stack(
              children: [
                header(),
                Container(
                  margin: EdgeInsets.only(top: 80.h),
                  height: 80.h,
                  child: Container(
                      alignment: Alignment.center,
                      child: MetaImageView(path: FlavourConstants.flavourAssetPath+AssetConstants.logoRound,wd: 80,ht: 80)
                  ),
                ),
              ],
            ),
          ...[
            SizedBox(height: 5.h),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MetaTextView(
                  text: "UI/UX Designer",
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 20.0,fontColor: MetaColors.primaryColor,
                      fontFamily: FontConstants.FONT_BOLD)
              ),
            ),
            SizedBox(height: 5.h),
            MetaRowView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: MetaTextView(
                        text: "Google",
                        textAlign: TextAlign.start,
                        textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.primaryColor,
                            fontFamily: FontConstants.FONT_SEMI_BOLD)
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: MetaTextView(
                        text: "California",
                        textAlign: TextAlign.start,
                        textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.primaryColor,
                            fontFamily: FontConstants.FONT_SEMI_BOLD)
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: MetaTextView(
                        text: "1 day ago",
                        textAlign: TextAlign.start,
                        textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.primaryColor,
                            fontFamily: FontConstants.FONT_SEMI_BOLD)
                    ),
                  )
                ].expandedEqually().toList()),
            SizedBox(height: 15.h),
          ],
          Expanded(child: bodyView())
          ],
        ),
      ),
    );
  }
  Widget header(){
    return Container(
      height: 120.h,
      color:MetaColors.primaryColor,
      child: MetaColumnView(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MetaAppBar(textTitle:"",centerTitle:false,actionWidgets: [
            Container(
              padding: EdgeInsets.only(right: 10.w),
              alignment: Alignment.center,
              child: MetaIcon(
                icon: LineIcons.verticalEllipsis,
                color: MetaColors.whiteColor,
              ),
            )
          ], ),
        ],
      ),
    );
  }


  Widget title(text){
    return Container(
      child: MetaTextView(
          text: text,
          textAlign: TextAlign.start,
          textStyle: const MetaStyle(fontSize: 15.0,fontColor: MetaColors.blackColor,
              fontFamily: FontConstants.FONT_BOLD)
      ),
    );
  }

  Widget subTitle(text){
    return Container(
      child: MetaTextView(
          text: text,
          textAlign: TextAlign.start,
          textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.blackColor,
              fontFamily: FontConstants.FONT_BOLD)
      ),
    );
  }

  Widget textView(text){
    return Container(
      child: MetaTextView(
          text: text,
          textAlign: TextAlign.start,
          textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.blackColor,
              fontFamily: FontConstants.FONT_REGULAR)
      ),
    );
  }

  bodyView() {
   return SingleChildScrollView(
     padding: EdgeInsets.symmetric(horizontal: 20.w),
     child: MetaColumnView(
       mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(uploadState != UploadState.UPLOADED)
          ...[
            title("Upload CV"),
            SizedBox(height: 5.h,),
            textView("Add your CV/Resume to apply for a job"),
          ],

          getStates(),
          if(uploadState != UploadState.UPLOADED)
          ...[
            SizedBox(height:20.h,),
            title("Information"),
            SizedBox(height: 5.h,),
            Container(
              child: MetaTextField(
                hintText: "Explain why you are the right person for this job",
                backgroundColor: Colors.white,
                hintStyle: const MetaStyle(fontSize: 14.0,fontColor: MetaColors.blackColor,
                    fontFamily: FontConstants.FONT_REGULAR),
                maxLines: 7,
                controller: TextEditingController(),
              ),
            )
          ]


        ],
      ),
   );
  }

  getStates() {

    switch(uploadState){
      case UploadState.ZERO :
        return MetaDottedBorder(
          child: Container(
            height: 60.h,
            child: MetaRowView(
              children: [
                MetaIcon(
                  icon: LineIcons.fileUpload,
                  color: MetaColors.primaryColor,
                ),
                textView("Upload CV/Resume"),
              ],
            ),
          ),
        );

      case UploadState.ADDED :
        return MetaDottedBorder(
          child: Container(
            alignment: Alignment.center,
            height: 105.h,
            child: MetaColumnView(
              children: [
                ListTile(
                  leading: MetaIcon(
                    icon: LineIcons.pdfFile,
                    color: MetaColors.redColor,
                    size: 35.w,
                  ),
                  minLeadingWidth: 0,
                  title: subTitle("Vikranth Salian - CV - UI/UX Designer"),
                  subtitle:MetaTextView(
                      text: "867 Kb 14 Feb 2022 at 11:30 am",
                      textAlign: TextAlign.start,
                      textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.a6b9Color,
                          fontFamily: FontConstants.FONT_REGULAR)
                  )

                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: MetaRowView(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MetaIcon(icon: LineIcons.trash,color: MetaColors.redColor,),
                          MetaTextView(
                              text: "Remove File",
                              textAlign: TextAlign.start,
                              textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.redColor,
                                  fontFamily: FontConstants.FONT_BOLD)
                          )
                        ]
                    ),
                  ),
                )
              ],
            )
          ),
        );

      case UploadState.UPLOADED :
        return Container(
          child: MetaColumnView(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 80.h,
                  decoration: BoxDecoration(
                      color: MetaColors.d6CColor,
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: ListTile(
                      leading: MetaIcon(
                        icon: LineIcons.pdfFile,
                        color: MetaColors.redColor,
                        size: 35.w,
                      ),
                      minLeadingWidth: 0,
                      title: subTitle("Vikranth Salian - CV - UI/UX Designer"),
                      subtitle:MetaTextView(
                          text: "867 Kb 14 Feb 2022 at 11:30 am",
                          textAlign: TextAlign.start,
                          textStyle: const MetaStyle(fontSize: 12.0,fontColor: MetaColors.a6b9Color,
                              fontFamily: FontConstants.FONT_REGULAR)
                      )

                  )
              ),
              Container(
                  alignment: Alignment.center,
                  child: MetaImageView(path: FlavourConstants.baseImagePath+AssetConstants.uploaded,wd: 120,ht: 120)
              ),
              MetaTextView(
                  text: "Successful",
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 20.0,fontColor: MetaColors.blackColor,
                      fontFamily: FontConstants.FONT_BOLD)
              ),
              SizedBox(height: 10.h,),
              MetaTextView(
                  text: "Congratulations, your application has been sent",
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 14.0,fontColor: MetaColors.labelFieldTextColor,
                      fontFamily: FontConstants.FONT_REGULAR)
              ),
              SizedBox(height: 30.h,),
              Container(
                width: 300.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                color: MetaColors.whiteColor,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  decoration: BoxDecoration(
                      color: MetaColors.d6CColor,
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: MetaTextView(
                      text: "Find a similar job".toUpperCase(),
                      textStyle: const MetaStyle(fontSize: 18.0,fontColor: MetaColors.primaryColor,
                          fontFamily: FontConstants.FONT_BOLD)
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                width: 300.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                color: MetaColors.whiteColor,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  decoration: BoxDecoration(
                      color: MetaColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: MetaTextView(
                      text: "Back to home".toUpperCase(),
                      textStyle: const MetaStyle(fontSize: 18.0,fontColor: MetaColors.whiteColor,
                          fontFamily: FontConstants.FONT_BOLD)
                  ),
                ),
              )
            ],
          ),
        );
      default:
        return MetaDottedBorder(
          child: Container(
            height: 60.h,
            child: MetaRowView(
              children: [
                MetaIcon(
                  icon: LineIcons.fileUpload,
                  color: MetaColors.primaryColor,
                ),
                textView("Upload CV/Resume"),
              ],
            ),
          ),
        );


    }

  }


}