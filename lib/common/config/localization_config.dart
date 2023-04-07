import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MetaLocalizationConfig {

  ensureInitialized()async{
  await EasyLocalization.ensureInitialized();
  }


  addLocalization(getChild,{required assetPath}){
    return EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
        path: assetPath,
        fallbackLocale: Locale('en', 'US'),
        child: getChild
    );
  }
}