import 'package:flutter/material.dart';

import 'browser.dart';

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
        body: Center(
            child: Browser(
                url: 'https://xuyang1638.github.io/',
                title: 'Recite Register')
        )
    );
  }
}
