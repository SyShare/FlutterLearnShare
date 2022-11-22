import 'package:flutter/material.dart';
import 'package:flutter_one/newApp/ui/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../util/router.dart';


class LoginScreen extends StatefulWidget {
  final Color? backgroundColor1 = const Color(0xFF444152);
  final Color? backgroundColor2 = const Color(0xFF6f6c7d);
  final Color? highlightColor = const Color(0xfff65aa3);
  final Color? foregroundColor = Colors.white;
  final AssetImage? logo = const AssetImage("assets/images/full-bloom.png");

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}




class _LoginScreenState extends State<LoginScreen> {

  var account = "";

  TextEditingController accountController = TextEditingController(

  );

  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: const Alignment(1.0, 0.0),
              // 10% of the width, so there are ten blinds.
              colors: [widget.backgroundColor1!, widget.backgroundColor2!],
              // whitish to gray
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 110.0, bottom: 50.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 128.0,
                        width: 128.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.foregroundColor!,
                            width: 1.0,
                          ),
                          shape: BoxShape.circle,
                          //image: DecorationImage(image: this.logo)
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: widget.foregroundColor,
                          radius: 100.0,
                          child: const Text(
                            "S",
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Samarth Agarwal",
                          style: TextStyle(color: widget.foregroundColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: widget.foregroundColor!,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 00.0),
                      child: Icon(
                        Icons.alternate_email,
                        color: widget.foregroundColor,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: accountController,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        maxLength: 11,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'samarthagarwal@live.com',
                          hintStyle: TextStyle(color: widget.foregroundColor),
                        ),
                        onChanged: (s) => {
                          accountController.text = s
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: widget.foregroundColor!,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                      child: Icon(
                        Icons.lock_open,
                        color: widget.foregroundColor,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: pwdController,
                        obscureText: false,
                        maxLines: 1,
                        maxLength: 4,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '8231OR7677',
                          hintStyle: TextStyle(color: widget.foregroundColor),
                        ),
                        onChanged: (s) => {
                        pwdController.text = s
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: widget.highlightColor,
                        onPressed: () => {
                          jumpHomePage()
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color:widget.foregroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        onPressed: () => {},
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              color: widget.foregroundColor!.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Divider(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        onPressed: () => {},
                        child: Text(
                          "Don't have an account? Create One",
                          style: TextStyle(
                              color: widget.foregroundColor!.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  jumpHomePage() {
    if(accountController.text.isEmpty){
      Fluttertoast.showToast(
        msg: '请输入账号',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
      );
      return;
    }
    if(pwdController.text.isEmpty){
      Fluttertoast.showToast(
        msg: '请输入密码',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
      );
      return;
    }
    MyRouter.pushPageReplacement(
      context,
      const HomeScreen(),
    );

  }
}
