import 'package:flutter/material.dart';
import 'package:flutter_one/buttons/simple_round_icon_button.dart';
import 'package:flutter_one/buttons/simple_round_only_icon_button.dart';

import '../../buttons/simple_round_button.dart';

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 30.0),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SimpleRoundButton(
                backgroundColor: Colors.redAccent,
                buttonText: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SimpleRoundIconButton(
                backgroundColor: Colors.orangeAccent,
                buttonText: const Text(
                  "SEND EMAIL",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.email),
              ),
              SimpleRoundIconButton(
                backgroundColor: Colors.pinkAccent,
                buttonText: const Text(
                  "LISTEN TO MUSIC",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.headset_mic),
                iconAlignment: Alignment.centerRight,
              ),
              SimpleRoundIconButton(
                backgroundColor: Colors.deepOrangeAccent,
                buttonText: const Text(
                  "SHARE ON SOCIAL",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.share),
              ),
              SimpleRoundOnlyIconButton(
                backgroundColor: Colors.lightGreen,
                icon: const Icon(Icons.share),
                iconAlignment: Alignment.center,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: SimpleRoundOnlyIconButton(
                      backgroundColor: Colors.blueAccent,
                      icon: const Icon(Icons.phone),
                      iconAlignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: SimpleRoundOnlyIconButton(
                      backgroundColor: Colors.redAccent,
                      icon: const Icon(Icons.message),
                      iconAlignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              SimpleRoundOnlyIconButton(
                backgroundColor: Colors.green,
                icon: const Icon(Icons.message),
                iconColor: Colors.redAccent,
                iconAlignment: Alignment.centerRight,
              ),
              SimpleRoundOnlyIconButton(
                backgroundColor: Colors.redAccent,
                icon: const Icon(Icons.details),
                iconColor: Colors.redAccent,
                iconAlignment: Alignment.centerLeft,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.66,
                    child: SimpleRoundIconButton(
                      backgroundColor: Colors.deepOrangeAccent,
                      buttonText: const Text(
                        "PLAY",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(Icons.play_arrow),
                      iconAlignment: Alignment.centerRight,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: SimpleRoundButton(
                      backgroundColor: Colors.greenAccent,
                      buttonText: const Text(
                        "OK",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
