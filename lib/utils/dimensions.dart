import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // Height
  static double height5ScaleFactor = screenHeight / 5;
  static double height10ScaleFactor = screenHeight / 10;
  static double height15ScaleFactor = screenHeight / 15;
  static double height20ScaleFactor = screenHeight / 20;
  static double height30ScaleFactor = screenHeight / 30;
  static double height35ScaleFactor = screenHeight / 35;
  static double height45ScaleFactor = screenHeight / 45;

  static double height5 = screenHeight / height5ScaleFactor;
  static double height10 = screenHeight / height10ScaleFactor;
  static double height15 = screenHeight / height15ScaleFactor;
  static double height20 = screenHeight / height20ScaleFactor;
  static double height30 = screenHeight / height30ScaleFactor;
  static double height35 = screenHeight / height35ScaleFactor;
  static double height45 = screenHeight / height45ScaleFactor;

  // Width
  static double width5ScaleFactor = screenWidth / 5;
  static double width10ScaleFactor = screenWidth / 10;
  static double width15ScaleFactor = screenWidth / 15;
  static double width20ScaleFactor = screenWidth / 20;
  static double width30ScaleFactor = screenWidth / 30;
  static double width35ScaleFactor = screenWidth / 35;
  static double width45ScaleFactor = screenWidth / 45;

  static double width5 = screenWidth / width5ScaleFactor;
  static double width10 = screenWidth / width10ScaleFactor;
  static double width15 = screenWidth / width15ScaleFactor;
  static double width20 = screenWidth / width20ScaleFactor;
  static double width30 = screenWidth / width30ScaleFactor;
  static double width35 = screenWidth / width35ScaleFactor;
  static double width45 = screenWidth / width45ScaleFactor;

  // Font
  static double font20 = screenHeight / height20ScaleFactor;

  // Radius
  static double radius15 = screenHeight / height15ScaleFactor;
  static double radius20 = screenHeight / height20ScaleFactor;
  static double radius30 = screenHeight / height30ScaleFactor;

  // Icon Size
  static double iconSize24ScaleFactor = screenHeight / 24;

  static double iconSize24 = screenHeight / iconSize24ScaleFactor;

  // Page View
  static double pageViewScaleFactor = screenHeight / 320;
  static double pageViewContainerScaleFactor = screenHeight / 220;
  static double pageViewTextScaleFactor = screenHeight / 120;

  static double pageView = screenHeight / pageViewScaleFactor;
  static double pageViewContainer = screenHeight / pageViewContainerScaleFactor;
  static double pageViewTextContainer = screenHeight / pageViewTextScaleFactor;

}
