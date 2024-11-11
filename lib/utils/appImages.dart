import 'dart:io';



import 'appTheme.dart';

abstract class AppImages {

  static String imageExt(String path) => "assets/images/$path";

  static String menuExt(String path) => "assets/cbt_icons/$path";

  static String get logo => imageExt("dsslogo.jpg");
  static String get web => menuExt("web.png");
  static String get log => menuExt("log.png");
  static String get help => menuExt("help.png");
  static String get fb => menuExt("fb.jpg");


  static String get cbtLogoSingle => imageExt("ic_logo.png");

  static String get qr => imageExt("qr.jpeg");

  static String get backgroungImage => imageExt("form-bg.png");

  static String get register => imageExt("register.png");

  static String get recommend => imageExt("recommend-icon.png");

  static const String defaultIDoctorImagePath =
      "https://image.freepik.com/free-vector/doctor-icon-avatar-white_136162-58.jpg";

  static String wNoImageURL =
      "https://www.samsung.com/etc/designs/smg/global/imgs/support/cont/NO_IMG_600x600.png";

  static String wServerBaseImagePath =
      "http://www.test.cboinfotech.com/uploads/";

  static String wServerImagePath({String? fileName}) =>
      wServerBaseImagePath + fileName!;

  static String wValidateImagePath({String? fileName, bool isUser = false}) {
    if (fileName == null) {
      return isUser ? defaultIDoctorImagePath : wNoImageURL;
    } else if (fileName.isEmpty) {
      return isUser ? defaultIDoctorImagePath : wNoImageURL;
    } else if (fileName.contains("http") && isImageTypeOfURL(fileName)) {
      return fileName;
    } else if (fileName.contains("http") && !isImageTypeOfURL(fileName)) {
      return isUser ? defaultIDoctorImagePath : wNoImageURL;
    } else if (!fileName.contains("http") && isImageTypeOfURL(fileName)) {
      return isUser ? defaultIDoctorImagePath : wNoImageURL;
    } else {
      return wServerImagePath(fileName: fileName);
    }
  }

  static bool isImageTypeOfURL(String fileName) {
    if (fileName.contains(".png") ||
        fileName.contains(".PNG") ||
        fileName.contains(".jpg") ||
        fileName.contains(".JPG") ||
        fileName.contains(".jpeg") ||
        fileName.contains(".JPEG")) {
      return true;
    } else {
      return false;
    }
  }



}