// Copyright 2019 The Flutter Team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:f_stellar_app/src/data/models.dart';
import 'package:f_stellar_app/src/tabbar_screen.dart';
import 'package:f_stellar_app/src/login.dart';
import 'package:f_stellar_app/src/welcome_screen.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: isIOS
          ? CupertinoApp(
              debugShowCheckedModeBanner: false,
              theme: CupertinoThemeData(
                primaryColor: Color(0xFFFF2D55),
              ),
              initialRoute: '/',
              routes: <String, WidgetBuilder>{
                  '/': (BuildContext context) => WelcomeScreen(),
                '/home': (BuildContext context) => WelcomeScreen(),
                '/loginPage': (BuildContext context) => LoginPage(),
                  '/main_page': (BuildContext context) => NavigationBarScreen()
                })
          : MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.red,
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: <String, WidgetBuilder>{
                  '/': (BuildContext context) => WelcomeScreen(),
                '/home': (BuildContext context) => WelcomeScreen(),
                '/loginPage': (BuildContext context) => LoginPage(),
                '/main_page': (BuildContext context) => NavigationBarScreen()
                }),
    );

  }
}
