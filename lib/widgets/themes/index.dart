/// @Author: xiaojia.dxj
/// @Date: 2018-12-24 16:31:09
/// @Last Modified by:   xiaojia.dxj
/// @Last Modified time: 2018-12-24 16:31:09

import 'package:flutter_one/model/widget.dart';

import './Material/index.dart' as Material;
import './Cupertino/index.dart' as Cupertino;

List<WidgetPoint> getWidgets() {
  List<WidgetPoint> result = [];
  result.addAll(Material.widgetPoints);
  result.addAll(Cupertino.widgetPoints);
  return result;
}
