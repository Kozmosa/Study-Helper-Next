import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_helper_next/userInterfaces.dart';
import 'package:study_helper_next/_globalVars.dart';
import 'package:study_helper_next/io.dart' as YangIO;

List<Map<String, dynamic>> GetData(groupName, chapterID) {
  var newPool = new GlobalVars();
  String url = newPool.rootServer + '/api/group/$groupName/$chapterID/status';
  YangIO.Network.GET(url, '', (resObj) {
    print(resObj);
  });
}

class LeaderIndexPage extends StatefulWidget {
  LeaderIndexPage({Key key}) : super(key: key);
  final String title = 'Leader UI';

  @override
  _LeaderIndexPageState createState() => _LeaderIndexPageState();
}

class _LeaderIndexPageState extends State<LeaderIndexPage> {
  String _groupName;
  List<Map<String, dynamic>> _members;
  @override
  Widget build(BuildContext context) {
    _members = [
      {'number': '20181901', 'recite': true, 'status': '已背'},
      {'number': '20181901', 'recite': true, 'status': '已背'},
      {'number': '20181901', 'recite': true, 'status': '已背'},
      {'number': '20181901', 'recite': true, 'status': '已背'},
      {'number': '20181901', 'recite': true, 'status': '已背'},
      {'number': '20181901', 'recite': true, 'status': '已背'},
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(''),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Group Name',
              ),
              onChanged: (value) {
                _groupName = value;
                print(_groupName);
              },
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text('查询组员背诵情况'),
              onPressed: (){
                Alerts.Dialog(
                    context,
                    '查询成功',
                    Text('${_members[0]['number']}  ${_members[0]['status'].toString()}\n'
                        '${_members[1]['number']}  ${_members[0]['status'].toString()}\n'
                        '${_members[2]['number']}  ${_members[0]['status'].toString()}\n'
                        '${_members[3]['number']}  ${_members[0]['status'].toString()}'),
                    () {
                    print('OK');
                });
              },
            ),
          ],
        )));
  }
}
