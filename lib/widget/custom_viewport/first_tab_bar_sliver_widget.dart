import 'package:flutter/material.dart';
import 'package:flutter_one/widget/custom_viewport/first_tab_bar_render_sliver.dart';

class FirstTabBarSliverWidget extends SingleChildRenderObjectWidget {
  const FirstTabBarSliverWidget({Widget? child, Key? key})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return FirstTabBarRenderSliver();
  }
}
