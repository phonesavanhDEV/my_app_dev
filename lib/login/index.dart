// import 'dart:ui';
// ignore_for_file: unnecessary_null_comparison

// import 'dart:js';

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app_dev/login/_forgotPassword.dart';
import 'package:my_app_dev/login/_phoneVerify.dart';
import 'package:my_app_dev/menu/home.dart';
import '/menu/launcher.dart';
import '/login/_signUp.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main()=>runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.purple,
//       ),
//       title: "Login App",
//       home: LoginApp(),
//     )
// );
class LoginApp extends StatefulWidget {
  LoginApp({Key? key}) : super(key: key);
  @override
  _LoginApp createState() => _LoginApp();
}

class _LoginApp extends State<LoginApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool _isHidden = true;
  Timer? _timer;

  void _styleLoad() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 2)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.blue.shade900
      ..backgroundColor = Colors.black
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.grey.withOpacity(0.7)
      ..userInteractions = true
      ..dismissOnTap = false
      ..textStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'NotoSansLao',
        fontSize: 18,
      );
  }

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //checkAuth(context);
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.purpleAccent,
                Colors.amber,
                Colors.blue,
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 325,
                height: 600,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 100,
                      width: 150,
                      child: Image.asset('assets/images/new_logo.png'),
                    ),
                    const Text(
                      "ເຂົ້າສູ່ລະບົບ",
                      style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          fontSize: 28,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "ສະບາຍດີ ທຸກທ່ານ",
                      style: TextStyle(
                        fontFamily: 'NotoSansLao',
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 260,
                      height: 60,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.red,
                            ),
                            labelText: "#ອີເມວ ...@example.com",
                            labelStyle: TextStyle(
                              fontFamily: 'NotoSansLao',
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 260,
                      height: 60,
                      child: TextField(
                        controller: passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                            suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    _isHidden = !_isHidden;
                                  });
                                },
                                child: Icon(
                                  _isHidden
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: Colors.red,
                                )),
                            labelText: "#ລະຫັດຜ່ານ ******",
                            labelStyle: TextStyle(
                              fontFamily: 'NotoSansLao',
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyforgotPassword()));
                            },
                            child: const Text(
                              "ລືມລະຫັດຜ່ານ?",
                              style: TextStyle(
                                  fontFamily: 'NotoSansLao',
                                  color: Colors.deepOrange),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0xFFE94057),
                                  Color(0xFFF27121),
                                ])),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'ເຂົ້າສູ່ລະບົບ',
                            style: TextStyle(
                                fontFamily: 'NotoSansLao',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      onTap: () {
                        _styleLoad();
                        EasyLoading.show(
                          status: 'ກຳລັງໂຫຼດ...',
                          maskType: EasyLoadingMaskType.black,
                        );
                        _timer = new Timer(const Duration(seconds: 2), () {
                          setState(() {
                            signIn(context);
                            EasyLoading.dismiss();
                          });
                        });

                        // _progress = 0;
                        // _timer?.cancel();
                        // _timer = Timer.periodic(
                        //     const Duration(milliseconds: 100), (Timer timer) {
                        //   EasyLoading.showProgress(_progress,
                        //       status:
                        //           '${(_progress * 100).toStringAsFixed(0)}%');
                        //   _progress += 0.03;

                        //   if (_progress >= 1) {
                        //     _timer?.cancel();
                        //     EasyLoading.dismiss();
                        //   }
                        //   //signIn(context);
                        // });
                      },
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MySignUpPage()));
                      },
                      child: const Text(
                        "(...ສະໝັກສະມາຊິກ...)",
                        style: TextStyle(
                            fontFamily: 'NotoSansLao',
                            color: Colors.deepOrange),
                      ),
                    ),
                    // const Text(
                    //   "ຫຼື ເຂົ້າສູ່ລະບົບຜ່ານບັນຊີອື່ນ",
                    //   style: TextStyle(
                    //       fontFamily: 'NotoSansLao',
                    //       fontWeight: FontWeight.normal),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () async {
                              // var isAppInstalledResult =
                              await LaunchApp.openApp(
                                androidPackageName: 'com.facebook.katana',
                                //iosUrlScheme: 'facebook://',
                                openStore: true,
                              );
                              // print(
                              //     'isAppInstalledResult => $isAppInstalledResult ${isAppInstalledResult.runtimeType}');
                            },
                            icon: const Icon(FontAwesomeIcons.facebook,
                                color: Colors.blue)),
                        IconButton(
                            onPressed: () async {
                              // var isAppInstalledResult =
                              await LaunchApp.openApp(
                                androidPackageName: 'com.android.chrome',
                                //iosUrlScheme: 'facebook://',
                                openStore: true,
                              );
                              // print(
                              //     'isAppInstalledResult => $isAppInstalledResult ${isAppInstalledResult.runtimeType}');
                            },
                            icon: const Icon(
                              FontAwesomeIcons.google,
                              color: Colors.redAccent,
                            )),
                        IconButton(
                            onPressed: () async {
                              // var isAppInstalledResult =
                              await LaunchApp.openApp(
                                androidPackageName: 'com.android.twitter',
                                //iosUrlScheme: 'facebook://',
                                openStore: true,
                              );
                              // print(
                              //     'isAppInstalledResult => $isAppInstalledResult ${isAppInstalledResult.runtimeType}');
                            },
                            icon: const Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.lightBlue,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyPhonePage()));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.phone,
                              color: Colors.green,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signIn(BuildContext context) async {
    _auth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((user) {
      checkAuth(context);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: Text(error.message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    });
  }

  Future checkAuth(BuildContext context) async {
    final User? user = await _auth.currentUser();
    if (user != null) {
      print("Already singed-in with");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Launcher(user)));
    }
  }
}

void _ButtonPressed(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    content: Text("coming soon", style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.red,
  ));
}
