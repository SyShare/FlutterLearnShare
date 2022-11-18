import 'package:flutter/material.dart';
import 'package:flutter_one/screens/screen_container.dart';

class ProgressSpinnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
