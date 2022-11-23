/// @author Nealyang
/// 新widget详情页模板import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_one/model/widget.dart';
import 'package:flutter_one/newApp/util/router.dart';
import 'package:flutter_one/widgets/index.dart';

class WidgetLearnDemo extends StatefulWidget {
  WidgetLearnDemo({Key? key}) : super(key: key);

  _WidgetDemoState createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetLearnDemo> {
  /// CollectionControlModel _collectionControl = new CollectionControlModel();
  List<WidgetPoint> widgetDemosList = new WidgetDemoList().getDemos();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _buildContent() {
    List<Widget> _list = [
      SizedBox(
        height: 10.0,
      ),
    ];
    widgetDemosList.forEach((item) {
      _list.add(_buildListItem(item));
      _list.add(
        SizedBox(
          height: 20.0,
        ),
      );
    });
    return _list;
  }

  Widget _buildListItem(WidgetPoint point) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: RaisedButton(
          onPressed: () {
            MyRouter.pushPageByBuilder(
                context, (context) => point.buildRouter(context));
          },
          child: Text(
            '${point.name}',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('LearnDemo'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            Column(
              children: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }
}
