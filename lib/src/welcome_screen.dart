import 'package:f_stellar_app/src/picker_example/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_stellar_app/src/utils/request.dart';
import 'package:f_stellar_app/src/tabbar_screen.dart';
import 'package:f_stellar_app/src/login.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void getData(context) {
    DioManager.getInstance().post('UserInfo', null,
        //正常回调
            (data) {
              getData1(context);
        },
        //错误回调
            (error) {
          Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(builder: (context) => new LoginPage()),
                        (route) => route == null);
        });
  }
  void getData1(context) {
    DioManager.getInstance().post('UserInfo', null,
        //正常回调
            (data) {
              if (data["x"]["ok"]) {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(builder: (context) => new NavigationBarScreen()),
                        (route) => route == null);
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(builder: (context) => new LoginPage()),
                        (route) => route == null);
              }
        },
        //错误回调
            (error) {
          Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(builder: (context) => new LoginPage()),
                        (route) => route == null);
        });
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      getData(context);
      print("addPostFrameCallback be invoke");
    });

  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/images/lion.png'),
        ));
    return Scaffold(body: Center(child: logo));
  }
}
