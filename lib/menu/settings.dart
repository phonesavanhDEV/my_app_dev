import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static const routeName = '/';

  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ການຕັ່ງຄ່າ'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('ການຕັ່ງຄ່າ'),
        ],
      )),
    );
  }
}
