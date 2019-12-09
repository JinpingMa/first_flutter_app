import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_stellar_app/widgets.dart';

class MinePage extends StatelessWidget {
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
                      Text('销售',
                          style: TextStyle(
                            color: CupertinoColors.black.withAlpha(240),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('17809876543',
                          style: TextStyle(
                            color: CupertinoColors.black.withAlpha(180),
                            fontSize: 14,
                          ))
                    ]))),
            Container(
                width: 10000,
                margin: EdgeInsets.only(
                  top: 12
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: CupertinoButton(
                  child: Text('登出',
                      style: TextStyle(
                          color: Color(0xFFe83f34),
                          fontSize: 16)),
                ))
          ])),
    );
  }
}
