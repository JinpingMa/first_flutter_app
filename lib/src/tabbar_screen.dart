// Copyright 2019 The Flutter Team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:f_stellar_app/src/picker_example/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:f_stellar_app/src/data/models.dart';
import 'package:f_stellar_app/src/data/veggie.dart';
import 'package:f_stellar_app/src/widgets.dart';
import 'package:f_stellar_app/src/adaptive_widgets.dart';
import 'package:f_stellar_app/src/mine_screen.dart';
import 'package:f_stellar_app/src/client/client_form.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

//void main() => runApp(MyApp());

class NavigationBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: AdaptiveMainScreen()
    );
  }
}

class AdaptiveMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext parentContext) {
    if (isIOS) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(
              title: Text('首页'),
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Log'),
              icon: Icon(CupertinoIcons.book),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.plus_circled),
            ),
            BottomNavigationBarItem(
              title: Text('List'),
              icon: Icon(CupertinoIcons.create),
            ),
            BottomNavigationBarItem(
              title: Text('我的'),
              icon: Icon(CupertinoIcons.person),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        tabBuilder: (context, index) {
          switch(index) {
            case 0:
              return CupertinoTabView(builder: (context) => PickerPage(),);
            case 1:
              return CupertinoTabView(builder: (context) => LogScreen(),);
            case 2:
              return CupertinoTabView(builder: (context) => AdditionDialog(parentContext:parentContext),);
            case 3:
              return CupertinoTabView(
                  builder: (context) => ListScreen(),
                  defaultTitle: ListScreen.title);
            case 4:
              return CupertinoTabView(builder: (context) => MineScreen(parentContext:parentContext),);
            default:
              return CupertinoTabView(builder: (context) => MineScreen(parentContext:parentContext),);
          }
        },
      );
    } else {
      return LogScreen();
    }
  }
}

class LogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppState>(context, listen: true);

    final dayModels = model.days.map((day) {
      return DailySummaryViewModel(
        day,
        model.entriesForDay(day).map((entry) {
          return LogEntryViewModel(entry, model.veggieById(entry.veggieId));
        }).toList(),
      );
    }).toList();

    return AdaptivePageScaffold(
      title: 'Your Log',
      child: ListView.builder(
        itemCount: dayModels.length,
        itemBuilder: (context, index) => DailyDisplay(dayModels[index]),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  static const title = 'Munch';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppState>(context, listen: true);

    return AdaptivePageScaffold(
      title: title,
      child: VeggieCardList(model.allVeggies, (id) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddToLogScreen(id),
          ),
        );
      }),
    );
  }
}

class AddToLogScreen extends StatelessWidget {
  const AddToLogScreen(this.veggieId);

  final int veggieId;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppState>(context, listen: true);

    return AdaptivePageScaffold(
      title: 'Add to Log',
      child: AddToLogForm(model.veggieById(veggieId), (entry) {
        model.addLogEntry(entry);
        Navigator.of(context).pop();
      }),
    );
  }
}

typedef LogEntryCallback = void Function(LogEntry entry);

class AddToLogForm extends StatefulWidget {
  const AddToLogForm(this.veggie, this.onEntryCreated);

  final Veggie veggie;

  final LogEntryCallback onEntryCreated;

  @override
  _AddToLogFormState createState() => _AddToLogFormState();
}

class _AddToLogFormState extends State<AddToLogForm> {
  static const double _summaryHeight = 175;

  final _servingsTextController = TextEditingController(text: '1');
  final _servingsFocusNode = FocusNode();
  int _mealType = 0;

  int get numberOfServings => int.parse(_servingsTextController.text);

  int get totalCalories => widget.veggie.caloriesPerServing * numberOfServings;

  int get totalVitaminA => widget.veggie.vitaminAPercentage * numberOfServings;

  int get totalVitaminC => widget.veggie.vitaminCPercentage * numberOfServings;

  @override
  Widget build(BuildContext context) {
    final textTheme = AdaptiveTextTheme.of(context);

    return Stack(
      children: <Widget>[
        ListView(
          padding: MediaQuery.of(context).padding +
              EdgeInsets.fromLTRB(24, 16, 24, 16 + _summaryHeight),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatCard(
                  child: ZoomClipAssetImage(
                    height: 112,
                    width: 112,
                    zoom: 2.4,
                    imageAsset: widget.veggie.imageAssetPath,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.veggie.name,
                        style: textTheme.tileTitle,
                      ),
                      SizedBox(height: 2),
                      Text(
                        widget.veggie.categoryName,
                        style: textTheme.label,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Line(),
            AdaptiveSegmentedControl(
              children: {
                0: Text('Breakfast'),
                1: Text('Lunch'),
                2: Text('Dinner'),
              },
              groupValue: _mealType,
              onValueChanged: (type) => setState(() => _mealType = type),
            ),
            SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  child: AdaptiveTextField(
                    controller: _servingsTextController,
                    focusNode: _servingsFocusNode,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (number) {
                      if (number.isNotEmpty) {
                        setState(_servingsFocusNode.unfocus);
                      }
                    },
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Servings of',
                      style: textTheme.label,
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.veggie.servingSize,
                      style: textTheme.body,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('1', style: textTheme.bodySmall),
                ),
                Expanded(
                  child: AdaptiveSlider(
                    value: numberOfServings.toDouble(),
                    min: 1,
                    max: 10,
                    divisions: 9,
                    onChanged: (value) {
                      setState(() => _servingsTextController.text =
                          value.floor().toString());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('10', style: textTheme.bodySmall),
                ),
              ],
            ),
            SizedBox(height: 8),
            Line(),
            QuoteText(text: widget.veggie.shortDescription),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 0,
          right: 0,
          child: AdaptiveBackground(
            intensity: 12,
            color: Color(0xAAF2F2F2),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Summary(
                    calories: totalCalories,
                    vitaminA: totalVitaminA,
                    vitaminC: totalVitaminC,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    alignment: Alignment.center,
                    child: AdaptiveButton(
                      child: Text('Add to Log'),
                      onPressed: () {
                        widget.onEntryCreated(LogEntry(
                          veggieId: widget.veggie.id,
                          servings: numberOfServings.floor(),
                          timestamp: DateTime.now(),
                          mealType: MealType.values[_mealType],
                        ));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AdditionDialog extends StatelessWidget {
  const AdditionDialog({this.parentContext});
  final BuildContext parentContext;
  void navigateToClientForm(context) {
    if (context != null) {
      Navigator.of(context).push(
          new MaterialPageRoute(builder: (context) => new ClientFormScreen()));
    }
  }
  void navigateToOther() {
    Fluttertoast.showToast(
        msg: "该功能赞未实现",
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 3,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(child: Text('录门店', style: TextStyle(color:Color(0xFFFF2D55),fontSize: 16)),onPressed: navigateToOther,),
        FlatButton(child: Text('录客户', style: TextStyle(color:Color(0xFFFF2D55),fontSize: 16)),onPressed: () => navigateToClientForm(parentContext),),
        FlatButton(child: Text('录拜访', style: TextStyle(color:Color(0xFFFF2D55),fontSize: 16)),onPressed: navigateToOther,),
      ],
    );
  }
}