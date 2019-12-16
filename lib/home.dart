import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_stellar_app/utils/request.dart';
import 'package:f_stellar_app/main_page.dart';
import 'package:f_stellar_app/login.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getData(context) {
    DioManager.getInstance().post('UserInfo', null,
        //正常回调
            (data) {
              print(data);
              if (data["x"]["ok"]) {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(builder: (context) => new MainPage()),
                        (route) => route == null);
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(builder: (context) => new LoginPage()),
                        (route) => route == null);
              }
        },
        //错误回调
            (error) {
          print('error');
          print(error);
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
