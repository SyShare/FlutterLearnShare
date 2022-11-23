import 'package:flutter_one/model/widget.dart';

import 'elements/index.dart' as elements;
import 'components/index.dart' as components;
import 'themes/index.dart' as themes;

class WidgetDemoList {
  WidgetDemoList();

  List<WidgetPoint> getDemos() {
    List<WidgetPoint> result = [];
    result.addAll(elements.getWidgets());
    result.addAll(components.getWidgets());
    result.addAll(themes.getWidgets());
    return result;
  }
}
