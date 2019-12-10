import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_stellar_app/utils/request.dart';
import 'package:f_stellar_app/main_page.dart';

class LoginPage extends StatelessWidget {

  void login(context) {
    print('http post:=========');

    Map<String, String> params = {
      "accountName": "huijuan.chen@zuodashi.com",
      "password": "zuodashi2019"
    };
    DioManager.getInstance().post('UserLogin', params,
        //正常回调
            (data) {
          print('data++++++++++++');
          print(data);
//          Navigator.pushNamed(context, '/main_page');
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => new MyApp()
              ), (route) => route == null);
        },
        //错误回调
            (error) {
          print('error');
          print(error);
        });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('獅子座'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          width: 10000,
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: CupertinoButton(
            onPressed: () => login(context),
            child: Text('登录',
                style: TextStyle(color: Color(0xFFe83f34), fontSize: 16)),
          )),
    );
  }
}
