import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_helper_next/reciteRegister/LeaderClient/leader.index.dart';

class ReciteRegisterPage extends StatefulWidget {
  ReciteRegisterPage({Key key}) : super(key: key);
  final String title = 'Recite Register';

  @override
  _ReciteRegisterPageState createState() => _ReciteRegisterPageState();
}

class _ReciteRegisterPageState extends State<ReciteRegisterPage> {

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
                  '背诵登记',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                  ),
                ),
                Text(''),
                CupertinoButton(
                  color: Colors.teal,
                  child: Text('I am the Student'),
                  onPressed: (){
                    //
                  },
                ),
                Text(''),
                CupertinoButton(
                  color: Colors.red,
                  child: Text('I am the Leader'),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LeaderIndexPage())
                    );
                  },
                ),
                Text(''),
                CupertinoButton(
                  color: Colors.blue,
                  child: Text('I am the Teacher'),
                  onPressed: (){
                    print('');
                  },
                ),
              ],
            )
        )
    );
  }
}
