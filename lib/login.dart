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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void login(context) {
    print('http post:=========');

    Map<String, String> params = {
      "accountName": emailController.text,
      "password": passwordController.text
    };
    DioManager.getInstance().post('UserLogin', params,
        //正常回调
            (data) {
          print('data++++++++++++');
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
          child: Container(
            padding: EdgeInsets.only(
              top: 60,
              left: 40,
              right: 40,
            ),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  width: 128,
                  height: 128,
                  child: Image.asset("assets/images/apple.jpg"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
//                  autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "邮箱",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    )),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
//                  autofocus: true,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "密码",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      child:
                          Text("重置密码", textAlign: TextAlign.right),
                      onPressed: () => {}),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [
                        Color(0xFFF58524),
                        Color(0xFFF92B7F),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      child: Text(
                        "登录",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () => login(context),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    errMsg ==null?'':errMsg,
                  )
                )
              ],
            ),
          )
          ),
    );
  }
}


