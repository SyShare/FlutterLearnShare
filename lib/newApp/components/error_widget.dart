import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final Function refreshCallBack;
  final bool isConnection;

  MyErrorWidget({Key? key, required this.refreshCallBack, this.isConnection = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            '😔',
            style: TextStyle(
              fontSize: 60.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              getErrorText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline6!.color,
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => refreshCallBack(),
            color: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text(
              'TRY AGAIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  getErrorText() {
    if (isConnection) {
      return 'There is a problem with your internet connection. '
          '\nPlease try again.';
    } else {
      return 'Could not load this page. \nPlease try again.';
    }
  }
}
