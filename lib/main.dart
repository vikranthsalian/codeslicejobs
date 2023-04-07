import 'dart:convert';

import 'package:codeslicejobs/common/config/app_routes.dart';
import 'package:codeslicejobs/common/config/localization_config.dart';
import 'package:codeslicejobs/common/config/navigator_key.dart';
import 'package:codeslicejobs/common/constants/theme_constants.dart';
import 'package:codeslicejobs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:easy_localization/easy_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureFlavour();
  await MetaLocalizationConfig().ensureInitialized();
  runApp( MetaLocalizationConfig().addLocalization( const MyApp(), assetPath: 'assets/translations'));
}

configureFlavour() async {
  // InjectorConfig.setup();
  String flavourData = await rootBundle.loadString("assets/codeslice/flavour.json");
  Map<String, dynamic> flavourJson = await json.decode(flavourData.toString());
  FlavorConfig(variables: flavourJson);
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          useInheritedMediaQuery: true,
          navigatorKey: appNavigatorKey,
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: "CodeSlice Jobs",
          onGenerateRoute: AppRoutes().generateRoute,
          themeMode: ThemeMode.system,
          theme: GlobalTheme().globalTheme,
        );
      },
    );
  }
}
