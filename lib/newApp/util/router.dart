import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Future pushPage(BuildContext context, Widget page) {
    var val = Navigator.push(
      context,
      ConcentricPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );

    return val;
  }

  static Future pushPageByBuilder(BuildContext context, WidgetBuilder builder) {
    var val = Navigator.push(
      context,
      ConcentricPageRoute(
        builder: builder,
      ),
    );

    return val;
  }

  static Future pushPageDialog(BuildContext context, Widget page) {
    var val = Navigator.push(
      context,
      ConcentricPageRoute(
        builder: (BuildContext context) {
          return page;
        },
        fullscreenDialog: true,
      ),
    );

    return val;
  }

  static pushPageReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      ConcentricPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }
}
