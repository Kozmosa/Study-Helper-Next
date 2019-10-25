import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../LeaderClient/query.dart';
import '../StudentClient/query.dart';

class LeaderHomePage extends StatefulWidget {
  LeaderHomePage({Key key}) : super(key: key);
  final String title = 'Recite Register';

  @override
  _LeaderHomePageState createState() => _LeaderHomePageState();
}

class _LeaderHomePageState extends State<LeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: <Widget>[
              Container(child: Text(''),),
              Container(
                child: Text(
                  '背诵登记',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              Text(''),
              Container(
                  child: CupertinoButton(
                    color: Colors.teal,
                    child: Text('Create Record'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentHomePage()));
                    },
                  ),),
              Text(''),
              Container(
                  child: CupertinoButton(
                    color: Colors.red,
                    child: Text('Check Records'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaderQueryPage()));
                    },
                  ),),
              Text(''),
              Container(
                child:CupertinoButton(
                  color: Colors.blue,
                  child: Text('Analyze Recent Status'),
                  onPressed: () {
                    print('');
                  },
                ),
              )
            ],
          )
        ])));
  }
}
