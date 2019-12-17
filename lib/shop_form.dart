import 'package:f_stellar_app/utils/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'dart:convert';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State < ShopPage > {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String errMsg = '';
  var pickerShow = true;
  List<Map<String, dynamic>> clientList;

  final emailController =
  TextEditingController(text: "jinping.ma@zuodashi.com");
  final passwordController = TextEditingController(text: "zuodashi2019");
  void fetchClientTypeData() {

    DioManager.getInstance().post('ClientTypeList', null,
        //正常回调
            (data) {
          setState(() {
            //更新UI等
//            clientList = data['data']['clientTypes'];
          });
        },
        //错误回调
            (error) {
              setState(() {
                //更新UI等
                clientList = [];
              });
        });
  }
  @override
  void initState() {
    super.initState();
    fetchClientTypeData();
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey < FormState > ();
  @override
  Widget build(BuildContext parentContext) {

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
    final formItem = [{
      "label": '客户名称',
      "placeholder": "不超过30个字"
    }, {
      "label": '客户类型',
      "placeholder": "请选择"
    }, {
      "label": '客户地址',
      "placeholder": "省、市、区"
    }];
//    void handlePress(int index) {
//      if (index == 2) {
////      setState(() {
////        pickerShow = true;
////      });
//      }
//    }
    const PickerData = '''
[
    {
        "a": [
            {
                "a1": [
                    1,
                    2,
                    3,
                    4
                ]
            },
            {
                "a2": [
                    5,
                    6,
                    7,
                    8
                ]
            },
            {
                "a3": [
                    9,
                    10,
                    11,
                    12
                ]
            }
        ]
    },
    {
        "b": [
            {
                "b1": [
                    11,
                    22,
                    33,
                    44
                ]
            },
            {
                "b2": [
                    55,
                    66,
                    77,
                    88
                ]
            },
            {
                "b3": [
                    99,
                    1010,
                    1111,
                    1212
                ]
            }
        ]
    },
    {
        "c": [
            {
                "c1": [
                    "a",
                    "b",
                    "c"
                ]
            },
            {
                "c2": [
                    "aa",
                    "bb",
                    "cc"
                ]
            },
            {
                "c3": [
                    "aaa",
                    "bbb",
                    "ccc"
                ]
            }
        ]
    }
]
    ''';
    showPickerModal(BuildContext context) {
      Picker picker = Picker(
          adapter: PickerDataAdapter<String>(pickerdata: JsonDecoder().convert(PickerData)),
          changeToFirst: true,
          textAlign: TextAlign.left,
          textStyle: const TextStyle(color: Colors.blue),
          selectedTextStyle: TextStyle(color: Colors.red),
          columnPadding: const EdgeInsets.all(8.0),
          onConfirm: (Picker picker, List value) {
            print(value.toString());
            print(picker.getSelectedValues());
          }
      );
      picker.show(_scaffoldKey.currentState);
    }
    List < Map < String, String >> contactList = [{
      "label": '联系人',
      "placeholder": "请填写"
    }, {
      "label": '联系电话',
      "placeholder": "请填写"
    }, ];
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
        child: Stack(children: < Widget > [
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
                    () => showPickerModal(parentContext)
                  ),
                );
              },
            )),
          Positioned(
            left: 20.0,
            right: 20.0,
            bottom: 90.0,
            child: loginButton),
//          Positioned(
//            left: 20.0,
//            right: 20.0,
//            bottom: 90.0,
//            child:
//            pickerShow ? Column(
//              children: < Widget > [
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: < Widget > [
//                    CupertinoButton(child: Text('取消', style: TextStyle(color: Colors.grey), ),
//                      onPressed: () {
//                        setState(() {
//                          pickerShow = false;
//                        });
//                      }),
//                    CupertinoButton(child: Text('确定'), onPressed: () {
//                      setState(() {
//                          pickerShow = false;
//                        });
//                    }),
//                  ]),
//                Container(
//                  height: 200,
//                  child:
//                  CupertinoPicker(
//                    itemExtent: 50,
//                    backgroundColor: Colors.white,
//                    onSelectedItemChanged: (int index) {
//                      print(index);
//                    },
//                    children: < Widget > [
//                      Text('col 1'),
//                      Text('col 2'),
//                      Text('col 3'),
//                      Text('col 4'),
//                    ],
//                  )
//
//                )
//              ]
//            ) : Container(height: 0, width: 0, )),
        ])));
  }
}
class CustomInputCell extends StatelessWidget {
  const CustomInputCell(this.label, this.placeholder, this.onCellTap);
  final String label;
  final String placeholder;
  final VoidCallback onCellTap;

  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onCellTap,
      pressedOpacity: 1,
        child: Row(
        children: < Widget > [
          Container(
            width: 80,
            child: Text(
              label == null ? '' : label,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 128,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: placeholder == null ? '' : placeholder,
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
      ));
  }
}