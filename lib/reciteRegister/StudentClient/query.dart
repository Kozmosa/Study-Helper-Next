import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_helper_next/userInterfaces.dart';
import 'package:study_helper_next/_globalVars.dart';
import 'package:study_helper_next/core/record.dart';

GlobalVars _global = new GlobalVars();

String GetData(studentID, chapterID, context) {
  RecordTool.GetRecords(studentID, chapterID, (records) {
    String allMsg = '';
    for(var record in records) {
      var msg = '---------\n背诵章节：${record['chapter_id']}\n背诵者学号：${record['student_id']}\n---------\n';
      allMsg+=msg;
    }
    Alerts.Dialog(context, '查询成功', Text(allMsg), () {
      print('Clicked ok.');
    });
  });
}

class StudentHomePage extends StatefulWidget {
  StudentHomePage({Key key}) : super(key: key);
  final String title = 'Student UI';

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  String _studentID;
  String _chapterID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(
              'Record Query UI',
              style: TextStyle(
                fontSize: 24
              ),
            ),
            Text(''),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Student ID',
              ),
              onChanged: (String value) {
                _studentID = value;
              },
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Chapter ID',
              ),
              onChanged: (String value) {
                _chapterID = value;
              },
            ),
            CupertinoButton(
              child: Text('Query Records'),
              onPressed: () {
                GetData(_studentID, _chapterID, context);
              },
              color: Colors.blue,
            )
          ],
        )));
  }
}
