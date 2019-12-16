import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String errMsg = '';

  final emailController =
      TextEditingController(text: "jinping.ma@zuodashi.com");
  final passwordController = TextEditingController(text: "zuodashi2019");

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final password = TextFormField(
        controller: passwordController,
        autofocus: false,
//      initialValue: 'zuodashi2019',
        obscureText: true,
        decoration: InputDecoration(
          hintText: '密码',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        )
//          border:
//          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          print('form key data');
          _formKey.currentState.save();
          Fluttertoast.showToast(
              msg: "This is Center Short Toast"
          );
          _formKey.currentState.reset();
        },
        padding: EdgeInsets.all(12),
        color: Color(0xFFFF2D55),
        child: Text('提交', style: TextStyle(color: Colors.white)),
      ),
    );
    final formItem = [
      {
        "label":'客户名称',
        "placeholder": "不超过30个字"
      },{
        "label":'客户类型',
        "placeholder": "请选择"
      },{
        "label":'客户地址',
        "placeholder": "省、市、区"
      }
    ];

    List<Map<String,String>> contactList = [
      {
        "label":'联系人',
        "placeholder": "请填写"
      },{
        "label":'联系电话',
        "placeholder": "请填写"
      },
    ];
//    List<Map<String,String>> allItem = formItem.addAll(contactList);

    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('表单'),
          backgroundColor: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Colors.white,
            width: 0.0, // One physical pixel.
            style: BorderStyle.none,
          )),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
            child: Stack(children: <Widget>[
              Form(
                  key: _formKey,
                  child: ListView.builder(
//                padding:
//                MediaQuery.of(context).padding + EdgeInsets.symmetric(vertical: 0),
                itemCount: (formItem + contactList).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 8.0,
                    ),
                    child: CustomInputCell(
                      (formItem + contactList)[index]['label'],
                      (formItem + contactList)[index]['placeholder'],
                    ),
                  );
                },
              )),
          CupertinoPicker(
            itemExtent: 50,
            onSelectedItemChanged: (int index) {
              print(index);
            },
            children: <Widget>[
              Text('col 1'),
              Text('col 1'),
              Text('col 1'),
              Text('col 1'),
            ],
          ),
          Positioned(
              left: 20.0,
              right: 20.0,
              bottom: 90.0,
              child: loginButton)
        ])));
  }
}

class CustomInputCell extends StatelessWidget {
  const CustomInputCell(this.label, this.placeholder);
  final String label;
  final String placeholder;
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 80,
          child: Text(
            label ==null?'':label,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 128,
          child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: placeholder==null?'':placeholder,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
