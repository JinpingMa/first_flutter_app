import 'package:flutter/cupertino.dart';

class MinePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('我的'),
          ),
          resizeToAvoidBottomInset: false,
          child: Text('我的'),
        );
  }
}