import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_helper_next/userInterfaces.dart';
import 'package:study_helper_next/_globalVars.dart';
import 'package:study_helper_next/core/io.dart' as YangIO;

var _allMsg = '';
void addMsg(msg) {
  print(msg);
  _allMsg = '$_allMsg$msg';
}

void PopupUI(context) {
  print('wdnmd\n$_allMsg');
  Alerts.Dialog(context, '查询成功', Text(_allMsg), () {});
  _allMsg = '';
}

String GetData(groupName, chapterID, context) {
  var newPool = new GlobalVars();
  String allMsg = '';
  String url = newPool.rootServer + '/api/group/$groupName/$chapterID/status';
  print(url);
  YangIO.Network.getJSON(url, (resObj) {
    print(resObj);
    String leader = resObj['status']['leader'];
    List members = resObj['status']['members'];
    Map status = resObj['status']['status'];
    print(status);
    for (var member in members) {
      var msg;
      if (status[member.toString()] == true) {
        msg = '已背';
      } else
        msg = '未背';
      YangIO.Network.pureGet(newPool.rootServer + '/api/student/name/$member',
          (content) {
        print(content['name']);
        var name = content['name'];
        allMsg += '$name $msg\n';
        addMsg('$name $msg\n');
      });
      print(allMsg);
    }
  });
  PopupUI(context);
}

class LeaderQueryPage extends StatefulWidget {
  LeaderQueryPage({Key key}) : super(key: key);
  final String title = 'Leader UI';

  @override
  _LeaderQueryPageState createState() => _LeaderQueryPageState();
}

class _LeaderQueryPageState extends State<LeaderQueryPage> {
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
              },
            ),
            CupertinoButton(
              color: Colors.blue,
              child: Text('查询组员背诵情况'),
              onPressed: () {
                String allMsg = GetData(_groupName, '6.1', context);
              },
            ),
          ],
        )));
  }
}
