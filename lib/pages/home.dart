import 'package:flutter/material.dart';
import 'package:study_helper_next/pages/classSchedule.dart';
import 'package:study_helper_next/pages/login.dart';
import 'package:study_helper_next/reciteRegister/reciteRegister.dart';
import 'package:study_helper_next/reader.dart';
import 'package:study_helper_next/core/charts.dart' as YangCharts;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _readerText = '';
  final String jinrishiciToken = 'pHcNfAtmhOKPOH9fYzekZ2wy13qMLqfI';
  bool _FirstRun = true;
  int _SecretPass = 0;
  final data = [
    new YangCharts.SubjectScores('Math', 97.0, 120.0),
    new YangCharts.SubjectScores('Chinese', 94.0, 120.0),
    new YangCharts.SubjectScores('English', 117.0, 120.0),
    new YangCharts.SubjectScores('Physics', 94.0, 100.0),
    new YangCharts.SubjectScores('History', 47.0, 50.0),
    new YangCharts.SubjectScores('Biology', 22.0, 30.0),
    new YangCharts.SubjectScores('Geography', 28.0, 30.0),
    new YangCharts.SubjectScores('Politics', 58.0, 70.0),
  ];

  final welcomeText =
      '欢迎使用学习助手，今天是${DateTime.now().year}年${DateTime.now().month}月${DateTime.now().day}日';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListBody(
              children: <Widget>[Image.asset('assets/simaface.jpg')],
            ),
            ListTile(
              leading: Icon(Icons.person_pin),
              title: Text('登录'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.table_chart),
              title: Text('课程表'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassSchedulePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('背诵登记'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReciteRegisterPage()),
                );
              },
            )
          ],
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    '时铭心中耻',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '我的成绩',
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    YangCharts.CreateChart('Bar', YangCharts.CreateSeries(data))
                  ],
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_SecretPass < 4) {
            _SecretPass+=1;
          }
          if(_SecretPass == 4) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReaderPage())
            );
          }
        },
        tooltip: 'WDNMD',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
