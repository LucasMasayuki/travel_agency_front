import 'package:flutter/cupertino.dart';

class MediaHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 600;
  }
}
