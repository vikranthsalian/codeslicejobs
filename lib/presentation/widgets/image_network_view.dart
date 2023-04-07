import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaImageNetworkView extends StatelessWidget {
  String url;
  double wd;
  double ht;
  MetaImageNetworkView({required this.url,this.wd=60,this.ht=60});

  @override
  Widget build(BuildContext context) {
    return  FadeInImage.assetNetwork(
      width: wd.h,
      height: ht.h,
      placeholder: 'assets/images/square_placeholder.jpg',
      fit: BoxFit.cover,
      image: url,
      imageErrorBuilder:(BuildContext context, Object exception, StackTrace? stackTrace){
        return Image.asset("assets/images/square_placeholder.jpg");
      } ,
    );

  }
  Widget errorImg(){
    return Container();
  }
}