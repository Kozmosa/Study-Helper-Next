import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'browser.dart';

class ReaderPage extends StatefulWidget {
  ReaderPage({Key key}) : super(key: key);
  final String title = 'Secret Reader';

  @override
  _ReaderPageState createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secret Reader'),
      ),
        body: Center(
            child: Browser(
                url: 'https://xuyang1638.github.io/',
                title: 'Recite Register')
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SystemNavigator.pop();
        },
        tooltip: 'Boss Coming',
        child: Icon(Icons.block),
      ), //
    );
  }
}