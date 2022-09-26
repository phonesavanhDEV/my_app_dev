import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import './login/index.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  // runApp(const MyApp());

  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.purple,
    ),
    title: "Login App",
    home: LoginApp(),
    builder: EasyLoading.init(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSwatch(
        //     primarySwatch: Colors.deepOrange,
        //   ).copyWith(
        //     secondary: Colors.deepOrange,
        //   ),
        //   textTheme: TextTheme(bodyText2: TextStyle(color: Colors.red)),
        // ),
        // title: 'First Flutter App',
        // initialRoute: '/',
        // routes: {
        //   Launcher.routeName: (context) => Launcher(),
        // },
        );
  }
}
