/// Created with Android Studio.
/// User: 三帆
/// Date: 05/02/2019
/// Time: 22:06
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

class CityPickerDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CityPickerDemo> {
  String? _result;
  show(context) async {
    List demoList = [
      {"icon": Icons.place, "name": "ios选择器", "routerName": '/name'},
      {"icon": Icons.fullscreen, "name": "三级全屏选择器", "routerName": '/full_page'},
      {
        "icon": Icons.location_city,
        "name": "城市选择器",
        "routerName": '/city_select'
      },
      {
        "icon": Icons.location_city,
        "name": "内置工具类",
        "routerName": '/util_getLocationInfo'
      },
    ];
    setState(() {
      _result = "${demoList.toString()}";
    });
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text("result: ${_result.toString()}"),
        RaisedButton(
          onPressed: () {
            this.show(context);
          },
          child: Text("select"),
        ),
      ],
    ));
  }
}
