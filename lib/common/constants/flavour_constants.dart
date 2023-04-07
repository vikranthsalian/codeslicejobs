
import 'package:flutter_flavor/flutter_flavor.dart';
class FlavourConstants {
  static  String apiHost =  FlavorConfig.instance.variables["baseUrl"] ;

  static  String appTitle =  FlavorConfig.instance.variables["appTitle"];
  static  String appSubTitle =  FlavorConfig.instance.variables["appSubTitle"];
  static  String flavourAssetPath =  FlavorConfig.instance.variables["flavourAssetPath"];
  static  bool showNetworkLogs =  FlavorConfig.instance.variables["showNetworkLogs"];


//  static  String flavour =  FlavorConfig.instance.name.toString();
//  static  bool enableTesting =  FlavorConfig.instance.variables["enableUnitTesting"];
}