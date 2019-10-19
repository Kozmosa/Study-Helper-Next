import 'package:flutter/material.dart';

class Alerts {
  static void Dialog(
      BuildContext context, String title, Widget content, Function okCallback) {
    showDialog(
        // 设置点击 dialog 外部不取消 dialog，默认能够取消
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              // 标题文字样式
              content: content,
              // 内容文字样式
//              backgroundColor: Colors.white,
              elevation: 8.0,
              semanticLabel: 'Label',
              shape: Border.all(),
              actions: <Widget>[
                FlatButton(onPressed: okCallback, child: Text('确认')),
                FlatButton(
                    onPressed: () => Navigator.pop(context), child: Text('关闭')),
              ],
            ));
  }
}
