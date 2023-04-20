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


class DetailScreen extends StatelessWidget {
  final _selectedColor = MetaColors.primaryColor;
  final _tabs = [
    Tab(text: 'Job Description'),
    Tab(text: 'Company'),

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        color: MetaColors.whiteColor,
        child: MetaRowView(
          children: [
            NonExpWidget(widget:
              Container(
                padding: EdgeInsets.only(right: 10.w),
                child: MetaIcon(
                  icon: LineIcons.bookmark,
                  color: MetaColors.primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(appNavigatorKey.currentState!.context, RouteConstants.uploadPath);
              },
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
            ),
          ].expandedEqually().toList(),
        ),
      ),
      body: Container(
        child: Column(
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


          MetaColumnView(children: [

            SizedBox(height: 5.h),
            Container(
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
          ]),
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
                icon: LineIcons.share,
                color: MetaColors.whiteColor,
              ),
            )
          ], ),
        ],
      ),
    );
  }

  Widget bodyView(){
    return Transform.translate(
      offset: Offset(0,0.h),
      child: Container(
        child: DefaultTabController(
          length: _tabs.length,
          child: MetaColumnView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                height: 32.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: TabBar(
                  //   controller: _tabController,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: _selectedColor),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: _tabs,
                ),
              ),
              SizedBox(height: 10.h,),
              Expanded(
                child: Container(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                    jobDesc(),
                    company(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget jobDesc(){
    return Container(
      color: MetaColors.whiteColor,
      child: SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: MetaColumnView(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title("Job Description"),
              textView("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem ..."),
              SizedBox(height: 10.h,),
              title("Requirements"),
              MetaTextView(
                  text: "1. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium\n"
                      "2. totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt\n"
                      "3. explicabo. Nemo enim ipsam voluptatem ...",
                  textAlign: TextAlign.start,
                  textStyle: const MetaStyle(fontSize: 13.0,fontColor: MetaColors.blackColor,
                      fontFamily: FontConstants.FONT_REGULAR)
              ),
              SizedBox(height: 10.h,),
              title("Informations"),
              bodyInformantion(),
              SizedBox(height: 10.h,),
              title("Facilities"),
              bodyFacilties(),
            ],
          ),
        ),
      ),
    );
  }

  Widget company(){
    return Container(
      color: MetaColors.whiteColor,
      child: SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: MetaColumnView(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title("About Company"),
              textView("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas .\nNor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain."),
              SizedBox(height: 10.h,),
              title("Website"),
              textView("https://www.google.com"),
              SizedBox(height: 10.h,),
              title("Industry"),
              textView("Internet product"),
              SizedBox(height: 10.h,),
              title("Employee size"),
              textView("132,121 Employees"),
              SizedBox(height: 10.h,),
              title("Head office"),
              textView("Mountain View, California, Amerika Serikat"),
              SizedBox(height: 10.h,),
              title("Type"),
              textView("Multinational company"),
              SizedBox(height: 10.h,),
              title("Since"),
              textView("1998"),
              SizedBox(height: 10.h,),
              title("Specialization"),
              textView("Search technology, Web computing, Software and Online advertising"),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
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

  Widget bodyInformantion(){
    return MetaColumnView(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subTitle("Position"),
          textView("Senior Designer"),
         SizedBox(height: 10.h,),
         subTitle("Qualification"),
          textView("Bachelor’s Degree"),
          SizedBox(height: 10.h,),
         subTitle("Experience"),
          textView("3 Years"),
          SizedBox(height: 10.h,),
         subTitle("Job Type"),
          textView("Full-Time"),
          SizedBox(height: 10.h,),
          subTitle("Specialization"),
          textView("Design"),
          SizedBox(height: 10.h,),
        ]);

  }

  Widget bodyFacilties(){
    return MetaColumnView(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textView("⬤ Medical"),
          SizedBox(height:5.h,),
          textView("⬤ Dental"),
          SizedBox(height: 5.h,),
          textView("⬤ Technical Cartification"),
          SizedBox(height: 5.h,),
          textView("⬤ Meal Allowance"),
          SizedBox(height: 5.h,),
          textView("⬤ Transport Allowance"),
          SizedBox(height: 5.h,),
          textView("⬤ Regular Hours"),
          SizedBox(height: 5.h,),
          textView("⬤ Mondays-Fridays"),
          SizedBox(height: 5.h,),

        ]);

  }

}