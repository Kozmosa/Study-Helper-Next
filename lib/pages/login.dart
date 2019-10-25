import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_helper_next/core/user.dart';
import 'package:study_helper_next/userInterfaces.dart';
import 'package:study_helper_next/reciteRegister/reciteRegister.dart';

bool Login(username, password, BuildContext context) {
  print('Username: $username');
  print('Password: $password');

  //  Network query
  User.Login(username, password, (flag) {
    if(flag == true){
      Alerts.Dialog(context, 'Login success', Text('OK'), () {
        print('ok');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReciteRegisterPage()),
        );
      });
    } else {
      Alerts.Dialog(context, 'Login failure', Text('failure'), () {
        print('failure');
      });
    }
  });
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  final String title = 'Login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, String> _UserInfo = {'username': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              leading: Icon(Icons.change_history),
              title: Text('Go back'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(' '),
            Text(
              'Login to Study Helper',
              style: TextStyle(fontSize: 22),
            ),
            Text(' '),
            Column(
              children: <Widget>[
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                  onChanged: (String value) {
                    _UserInfo['username'] = value;
                  },
                ),
                Text(' '),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (String value) {
                    _UserInfo['password'] = value;
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print(_UserInfo);
                    Login(_UserInfo['username'], _UserInfo['password'], context);
                  },
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'WDNMD',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
