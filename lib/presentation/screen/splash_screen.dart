


  import 'package:codeslicejobs/common/constants/asset_constants.dart';
import 'package:codeslicejobs/common/constants/flavour_constants.dart';
import 'package:codeslicejobs/presentation/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
     // nextScreen();
      ScreenUtil.init(context);
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       Theme.of(context).colorScheme.primary,
            //       Theme.of(context).colorScheme.secondary,
            //     ],
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //   ),
            // ),
            alignment: Alignment.center,
            child: Container(
                child: MetaImageView(path: FlavourConstants.flavourAssetPath+AssetConstants.logoRound,wd: 200,ht: 200)
            )
        )
        );
    }

  //   void nextScreen() async{
  //   User? user = FirebaseAuth.instance.currentUser;
  //   UserModel? model;
  //     if (user!= null) {
  //       EasyLoading.show(status: "Logging You In");
  //       if(!user.isAnonymous){
  //      Tuple2<UserModel?,String> modelData = await  Google().googleSignIn();
  //
  //        if(modelData.item1!=null){
  //          await authService?.updateUser(modelData.item1,response);
  //        }else{
  //          signout();
  //        }
  //       }else{
  //         model = await AnonymousLogin().anonymously();
  //         if(model!=null) {
  //           await authService?.updateUser(model, response);
  //         }else{
  //           signout();
  //         }
  //       }
  //       EasyLoading.dismiss(animation: true);
  //         Navigator.popAndPushNamed(context,RoutesHelper.home);
  //     }else{
  //         Navigator.popAndPushNamed(context,RoutesHelper.signin);
  //     }
  //
  //
  // }
  //
  //   void signout() {
  //   EasyLoading.show(status: "Signing Out");
  //   try {
  //     Google().googleLogout();
  //   }catch(e){
  //
  //   }
  //   Timer(const Duration(seconds: 2),() =>{
  //     EasyLoading.dismiss(animation: true),
  //     Navigator.pushNamedAndRemoveUntil(context,RoutesHelper.signin, (Route<dynamic> route) => true)
  //   });
  //
  // }


  }
