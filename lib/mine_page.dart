import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_stellar_app/utils/request.dart';
import 'package:f_stellar_app/login.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  String userName = '';
  String dept = '';
  String roleName = '';
  String phone = '';
//  DioManager().post()
  Future getData() async {
    print('http post:=========');

    Map<String, String> params = {
      "accountName": "huijuan.chen@zuodashi.com",
      "password": "zuodashi2019"
    };
    DioManager.getInstance().post('UserInfo', null,
        //正常回调
        (data) {
      print('userinfodata++++++++++++');
      print(data);
      setState(() {
        //更新UI等
        userName = data['data']['userName'];
        dept = data['data']['dept'];
        roleName = data['data']['roleName'];
        phone = data['data']['phone'];
      });
    },
        //错误回调
        (error) {
      print('error');
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('我的'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
//          width: 10000,
//          height: 260,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Column(children: [
            Container(
                width: 10000,
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      bottom: 18,
                    ),
                    child: Column(children: <Widget>[
                      Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.only(bottom: 12, top: 20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/cauliflower.jpg'),
                                  fit: BoxFit.cover))),
                      Text(userName == null ? '' : userName,
                          style: TextStyle(
                            color: CupertinoColors.black.withAlpha(240),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(phone == null ? '' : phone,
                          style: TextStyle(
                            color: CupertinoColors.black.withAlpha(180),
                            fontSize: 14,
                          ))
                    ]))),
            Container(
                width: 10000,
                margin: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: CupertinoButton(
                  onPressed: () => logOut(context),
                  child: Text('登出',
                      style: TextStyle(color: Color(0xFFe83f34), fontSize: 16)),
                ))
          ])),
    );
  }
}

void logOut(context) {
  Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => new LoginPage()),
      (route) => route == null);
//  Navigator.of(context).pushNamedAndRemoveUntil(
//      "/loginPage", ModalRoute.withName("/loginPage"));
}
