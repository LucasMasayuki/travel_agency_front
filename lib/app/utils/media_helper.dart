import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MediaHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 600;
  }

  static double getChildAspectRatio(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - 24) / 2;
    final double itemWidth = size.width / 2;

    return itemWidth / itemHeight;
  }

  static bool isFromApps() {
    return !kIsWeb;
  }
}
