import 'package:f_stellar_app/src/data/area.dart';
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
  List areaPickerData = [];
  final double listSpec = 4.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText;
  String clientTypeList = '';
  String clientType = '';
  String clientName = '';
  String contactName = '';
  String contactPhone = '';
  String areaString = '省、市、区';
  List areaArr = [];
  String specificAddress = '';
  String areaPickerDataString = '';

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
      "address":specificAddress,
      "province": areaArr[0],
      "city": areaArr[1],
      "district": areaArr[2]
    };

    DioManager.getInstance().post('ClientSave', para,
        //正常回调
            (data) {
      if(data["x"]["ok"]) {
        Fluttertoast.showToast(
          msg: "录入客户成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } else {
        Fluttertoast.showToast(
            msg: data["x"]["msg"]!=null?data["x"]["msg"]:"录入客户失败",
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 3,
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.grey,
            textColor: Colors.white);
      }
        },
        //错误回调
            (error) {
              Fluttertoast.showToast(
                  msg: error["x"]["msg"]!=null?error["x"]["msg"]:"录入客户失败",
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 3,
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white);
        });
  }
  List formatAreaPickerData() {
    List areaPickerData = [];
    Map provinceObj = AreaObjData["province_list"];
    Map<int, String> cityObj = AreaObjData["city_list"];
    Map districtObj = AreaObjData["county_list"];
    provinceObj.forEach((proKey, proValue) {

      Map specifyProvinceObj = {};
      specifyProvinceObj[proValue] =[];
      List cityList = [];
    
      cityObj.forEach((int cityKey, String cityValue) {

        if (proKey.toString().substring(0,2)==cityKey.toString().substring(0,2)){





          Map specifyCityObj = {};
          specifyCityObj[cityValue] = [];
          List districtList = [];
          districtObj.forEach((disKey, disVal) {
            if (cityKey.toString().substring(0,4)==disKey.toString().substring(0,4)){
              districtList.add(disVal);
            }

          });

          specifyCityObj[cityValue] = districtList;








          cityList.add(specifyCityObj);

        }

      });
      specifyProvinceObj[proValue] = cityList;

      areaPickerData.add(specifyProvinceObj);

    });

    return areaPickerData;

  }
  @override
  void initState() {
    super.initState();
    fetchClientTypeData();
    areaPickerDataString = JsonEncoder().convert(formatAreaPickerData());
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
        middle: Text('录客户'),
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
        child: Stack(children: <Widget>[
          ListView(
            children: <Widget>[
              CustomInputCell(
                label: '客户名称',
                placeholder: '不超过30个字',
                onValueChange: (val) {
                  setState(() {
                    clientName = val;
                  });
                },
              ),
              CustomCell(
                  label: '客户类型',
                  value: clientType,
                  rightIcon: Icon(
                    Icons.expand_more,
                    color: Colors.black54,
                    size: 36.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  onCellTap: () {
                    showClientTypePicker(context);
                  }),
              CustomCell(
                  label: '客户地址',
                  value: areaString,
                  rightIcon: Icon(
                    Icons.expand_more,
                    color: Colors.black54,
                    size: 36.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  onCellTap: () {
                    showAreaPicker(context, areaPickerDataString);
                  }),
              CustomInputCell(
                placeholder: '详细地址，最少5个字',
                onValueChange: (val) {
                  setState(() {
                    specificAddress = val;
                  });
                },
              ),
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
                  }
              )
//            submitButton
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.0,
            child: submitButton,
          )
        ],),
      ),
    );
  }

  showClientTypePicker(BuildContext context) {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(clientTypeList)),
        changeToFirst: true,
        textAlign: TextAlign.left,
        textStyle: const TextStyle(color: Colors.grey),
        selectedTextStyle: TextStyle(color: Colors.black),
        columnPadding: const EdgeInsets.all(8.0),
        confirmText: "确定",
        confirmTextStyle: TextStyle(color: Colors.red),
        cancelText: "取消",
        cancelTextStyle: TextStyle(color: Colors.grey),
        onConfirm: (Picker picker, List value) {
          setState(() {
            clientType = picker.getSelectedValues().join(" ");
          });
        });
    picker.show(_scaffoldKey.currentState);
  }
  showAreaPicker(BuildContext context, String areaPickerDataString) {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(areaPickerDataString)),
        changeToFirst: true,
        textAlign: TextAlign.left,
        textStyle: const TextStyle(color: Colors.grey),
        selectedTextStyle: TextStyle(color: Colors.black),
        columnPadding: const EdgeInsets.all(8.0),
        confirmText: "确定",
        confirmTextStyle: TextStyle(color: Colors.red),
        cancelText: "取消",
        cancelTextStyle: TextStyle(color: Colors.grey),
        onConfirm: (Picker picker, List value) {
          setState(() {
            areaString = picker.getSelectedValues().join(" ");
            areaArr = picker.getSelectedValues();
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
      this.inputType = '',
    this.rightIcon
  })
      : super();

  final String label;
  final String placeholder;
  final String value;
  final ValueChanged<String> onValueChange;
  final String inputType;
  final Widget rightIcon;

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
            ),
            rightIcon!=null?rightIcon:Container(width: 0,height: 0,)
          ],
        ));
  }
}

class CustomCell extends StatelessWidget {
  const CustomCell({this.label, this.value, this.onCellTap,this.rightIcon});

  final String label;
  final String value;
  final VoidCallback onCellTap;
  final Widget rightIcon;

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
              width: MediaQuery.of(context).size.width - 128,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(
                  value.isEmpty?'':value,
                  style: TextStyle(color: Colors.black87),
                ),
                rightIcon!=null?rightIcon:Container(width: 0,height: 0,)
              ],),
            ),
          ],
        ));
  }
}
