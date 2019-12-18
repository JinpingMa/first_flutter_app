import 'package:f_stellar_app/src/utils/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientFormScreen extends StatefulWidget {
  @override
  _ClientFormScreenState createState() => _ClientFormScreenState();
}

class _ClientFormScreenState extends State<ClientFormScreen> {
  final double listSpec = 4.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText;
  String clientTypeList = '';
  String clientType = '';
  String clientName = '';
  String contactName = '';
  String contactPhone = '';

  void fetchClientTypeData() {
    DioManager.getInstance().post('ClientTypeList', null,
        //正常回调
        (data) {
      var resData = data['data']['clientTypes'];
      List list = [];
      for (var i = 0; i < resData.length; i++) {
        list.add(resData[i]['clientTypeName']);
      }
      setState(() {
        //更新UI等
        clientTypeList = JsonEncoder().convert(list);
      });
    },
        //错误回调
        (error) {
      setState(() {
        //更新UI等
//            clientTypeList = [];
      });
    });
  }
  void submit() {
    Map para = {
      "clientId":0,
      "clientName":clientName,
      "clientType":clientType,
      "contactList":[{"contactName":contactName,"contactPhone":contactPhone}],
      "address":""
    };
    DioManager.getInstance().post('ClientSave', para,
        //正常回调
            (data) {
              Fluttertoast.showToast(
                  msg: "录入客户成功",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                timeInSecForIos: 3,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
              );
        },
        //错误回调
            (error) {
              Fluttertoast.showToast(
                  msg: error.x.msg!=null?error.x.msg:"录入客户失败",
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 3,
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white);
        });
  }
  @override
  void initState() {
    super.initState();
    fetchClientTypeData();
  }

  @override
  Widget build(BuildContext context) {
    final submitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => submit(),
        padding: EdgeInsets.all(12),
        color: Color(0xFFFF2D55),
        child: Text('提交', style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: CupertinoNavigationBar(
        middle: Text('录入客户'),
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
      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            CustomInputCell(
              label: '客户名称',
              placeholder: '不超过30个字',
              onValueChange: (val) {
                setState(() {
                  clientName = val;
                });
              },
//                    () {}
            ),
            CustomCell(
                label: '客户类型',
                value: clientType,
                onCellTap: () {
                  showPicker(context);
                }),
            CustomInputCell(
              label: '联系人',
              placeholder: '请填写',
              onValueChange: (val) {
                setState(() {
                  contactName = val;
                });
              },
            ),
            CustomInputCell(
              label: '联系电话',
              placeholder: '请填写',
              onValueChange: (val) {
                setState(() {
                  contactPhone = val;
                });
              },
            ),
            submitButton
          ],
        ),
      ),
    );
  }

  showPicker(BuildContext context) {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(clientTypeList)),
        changeToFirst: true,
        textAlign: TextAlign.left,
        textStyle: const TextStyle(color: Colors.blue),
        selectedTextStyle: TextStyle(color: Colors.red),
        columnPadding: const EdgeInsets.all(8.0),
        confirmText: "确定",
        confirmTextStyle: TextStyle(color: Colors.red),
        cancelText: "取消",
        cancelTextStyle: TextStyle(color: Colors.grey),
        onConfirm: (Picker picker, List value) {
          setState(() {
            clientType = picker.getSelectedValues()[0];
          });
        });
    picker.show(_scaffoldKey.currentState);
  }
}

class CustomInputCell extends StatelessWidget {
  const CustomInputCell({
    this.label = '',
    this.value = '',
      this.placeholder = '',
      this.onValueChange,
      this.inputType = ''
  })
      : super();

  final String label;
  final String placeholder;
  final String value;
  final ValueChanged<String> onValueChange;
  final String inputType;

  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
//        onPressed: onCellTap,
        pressedOpacity: 1,
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              child: Text(
                label == null ? '' : label,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 128,
              child: TextFormField(
                initialValue: value,
                  keyboardType: inputType == 'phone'
                      ? TextInputType.phone
                      : TextInputType.text,
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
                  onChanged: (val) {
                    onValueChange(val);
                  }),
            )
          ],
        ));
  }
}

class CustomCell extends StatelessWidget {
  const CustomCell({this.label, this.value, this.onCellTap});

  final String label;
  final String value;
  final VoidCallback onCellTap;

  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onCellTap,
        pressedOpacity: 1,
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              child: Text(
                label == null ? '' : label,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 168,
              decoration: BoxDecoration(
//                border: BoxBorder()
              ),
              child: Text(
                value,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Icon(
              Icons.expand_more,
              color: Colors.black54,
              size: 36.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ],
        ));
  }
}
