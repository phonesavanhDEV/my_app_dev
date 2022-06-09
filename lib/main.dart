import 'package:flutter/material.dart';
import './menu/launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.red)),
      ),
      title: 'First Flutter App',
      initialRoute: '/',
      routes: {
        Launcher.routeName: (context) => Launcher(),
      },
    );
  }
}
