import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_stellar_app/utils/request.dart';
import 'package:f_stellar_app/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errMsg = '';

  final emailController = TextEditingController(text: "jinping.ma@zuodashi.com");
  final passwordController = TextEditingController(text: "zuodashi2019");

  void login(context){
    Map<String, String> params = {
      "accountName": emailController.text,
      "password": passwordController.text
    };
    DioManager.getInstance().post('UserLogin', params,
        //正常回调
        (data) {
      print(data);
      if (data["x"]["ok"]) {
//          Navigator.pushNamed(context, '/main_page');
//      Navigator.of(context).pushAndRemoveUntil(
//          new MaterialPageRoute(builder: (context) => new MyApp()),
//          (route) => route == null);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ));
      } else {
        setState(() {
          errMsg = data["x"]["msg"];
        });
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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

    final email = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
//      initialValue: 'jinping.ma@zuodashi.com',
      decoration: InputDecoration(
          hintText: '公司邮箱',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
//      initialValue: 'zuodashi2019',
      obscureText: true,
      decoration: InputDecoration(
          hintText: '密码',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => login(context),
        padding: EdgeInsets.all(12),
        color: Color(0xFFFF2D55),
        child: Text('登录', style: TextStyle(color: Colors.white)),
      ),
    );

    final accountTooltip = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('登录说明'),
          Text('1 账号开通', style: TextStyle(
            color: Colors.black54
          )),
          Text('入职并通过HR在钉钉资料中填入佐大狮企业邮箱后，自动开通账号；账号为佐大狮邮箱前缀。'
              '例如，若您的佐大狮邮箱为zds@zuodashi.com，则在"账号中输入zds即可。', style: TextStyle(
              color: Colors.black54
          )),
          Text('2 登录权限', style: TextStyle(
              color: Colors.black54
          )),
          Text('只有"在职"的员工可以登录；未入职、离职员工无法登录。', style: TextStyle(
              color: Colors.black54
          )),
        ],
      ),
    );

    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('獅子座'),
          backgroundColor: Colors.white,
          border: Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 0.0, // One physical pixel.
                style: BorderStyle.none,
              )
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 48.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                loginButton,
                accountTooltip
              ],
            )));
//    return Scaffold(
//        appBar: CupertinoNavigationBar(
//          middle: Text('獅子座'),
//        ),
//        resizeToAvoidBottomInset: false,
//        backgroundColor: Colors.red,
//        body: Center(
//          child: Container(
////              width: 10000,
//              margin: EdgeInsets.only(top: 0),
//              decoration: BoxDecoration(
//                color: Color(0xFFFFFFFF),
//              ),
//              child: Container(
//                padding: EdgeInsets.only(
//                  top: 60,
//                  left: 40,
//                  right: 40,
//                ),
//                color: Colors.white,
//                child: ListView(
//                  children: <Widget>[
//                    SizedBox(
//                      width: 128,
//                      height: 128,
//                      child: Image.asset("assets/images/lion.png"),
//                    ),
//                    SizedBox(
//                      height: 20,
//                    ),
//                    TextFormField(
//                        controller: emailController,
////                  autofocus: true,
//                        keyboardType: TextInputType.emailAddress,
//                        decoration: InputDecoration(
//                          labelText: "邮箱",
//                          labelStyle: TextStyle(
//                            color: Colors.black38,
//                            fontWeight: FontWeight.w400,
//                            fontSize: 20,
//                          ),
//                        ),
//                        style: TextStyle(
//                          fontSize: 20,
//                        )),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    TextFormField(
//                      controller: passwordController,
////                  autofocus: true,
//                      keyboardType: TextInputType.text,
//                      obscureText: true,
//                      decoration: InputDecoration(
//                        labelText: "密码",
//                        labelStyle: TextStyle(
//                          color: Colors.black38,
//                          fontWeight: FontWeight.w400,
//                          fontSize: 20,
//                        ),
//                      ),
//                      style: TextStyle(
//                        fontSize: 20,
//                      ),
//                    ),
////                Container(
////                  height: 40,
////                  alignment: Alignment.centerRight,
////                  child: FlatButton(
////                      child:
////                          Text("重置密码", textAlign: TextAlign.right),
////                      onPressed: () => {}),
////                ),
//                    SizedBox(
//                      height: 40,
//                    ),
//                    Container(
//                      height: 60,
//                      alignment: Alignment.centerLeft,
//                      decoration: BoxDecoration(
//                        gradient: LinearGradient(
//                          begin: Alignment.topLeft,
//                          end: Alignment.bottomRight,
//                          stops: [0.3, 1],
//                          colors: [
//                            Color(0xFFF58524),
//                            Color(0xFFF92B7F),
//                          ],
//                        ),
//                        borderRadius: BorderRadius.all(
//                          Radius.circular(5),
//                        ),
//                      ),
//                      child: SizedBox.expand(
//                        child: FlatButton(
//                          child: Text(
//                            "登录",
//                            style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white,
//                              fontSize: 20,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                          onPressed: () => login(context),
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      height: 40,
//                    ),
//                    Container(
//                        height: 60,
//                        alignment: Alignment.centerLeft,
//                        child: Text('登录说明'
//                            '1 账号开通'))
//                  ],
//                ),
//              )),
//        ));
  }
}
