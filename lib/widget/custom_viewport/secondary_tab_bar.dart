import 'package:flutter/material.dart';
import 'package:flutter_one/widget/custom_viewport/secondary_tab_bar_sliver_widget.dart';

class SecondaryTabBar extends StatelessWidget {
  const SecondaryTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryTabBarSliverWidget(
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    return Container(
      height: 66,
      color: Colors.red.withOpacity(0.8),
      child: Center(child: Text('二级tab')),
    );
  }
}
