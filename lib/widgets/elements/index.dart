/// @Author: 一凨
/// @Date: 2018-11-16 15:09:31
/// @Last Modified by:   一凨
/// @Last Modified time: 2018-11-16 15:09:31

import 'package:flutter_one/model/widget.dart';

import 'Form/index.dart' as Form;
import 'Frame/index.dart' as Frame;
import 'Media/index.dart' as Media;

List<WidgetPoint> getWidgets() {
  List<WidgetPoint> result = [];
  result.addAll(Form.getWidgets());
  result.addAll(Frame.getWidgets());
  result.addAll(Media.getWidgets());
  return result;
}
