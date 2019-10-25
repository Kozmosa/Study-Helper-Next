import 'package:flutter/material.dart';
import '../_globalVars.dart';
import '../core/browser.dart';

GlobalVars _global = new GlobalVars();

class ClassSchedulePage extends StatefulWidget {
  ClassSchedulePage({Key key}) : super(key: key);
  final String title = 'Class Schedule';

  @override
  _ClassSchedulePageState createState() => _ClassSchedulePageState();
}

class _ClassSchedulePageState extends State<ClassSchedulePage> {
  String _day_of_the_week = DateTime.now().weekday.toString();

  @override
  Widget build(BuildContext context) {
    print(_day_of_the_week);
    return Scaffold(
        body: Center(
            child: Browser(
                url: '${_global.classScheduleRootDomain}perDay.api.no.toolbar.html?day=$_day_of_the_week',
                title: 'Class Schedule')
        )
    );
  }
}
