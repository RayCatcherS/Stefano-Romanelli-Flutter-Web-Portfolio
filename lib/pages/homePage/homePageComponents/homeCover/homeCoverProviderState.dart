import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class HomeCoverProviderState extends ChangeNotifier {

  String homeCoverUrl = "";
  Uint8List homeCoverImgData = Uint8List(0);
  String personalEmail = "";
  String linkedinUrl = "";


  String coverDescription1 = "";
  String coverDescription2 = "";
  
  String portfolioOwnerName = "";
  String portfolioOwnerRole = "";

  // notifyListeners();
}