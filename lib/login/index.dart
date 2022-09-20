// import 'dart:ui';
// ignore_for_file: unnecessary_null_comparison

// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/menu/launcher.dart';
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

class LoginApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
                            labelText: "ອີເມວ",
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
                        obscureText: true,
                        decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.eyeSlash,
                              color: Colors.red,
                            ),
                            labelText: "ລະຫັດຜ່ານ",
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
                              _ButtonPressed(context);
                            },
                            child: const Text(
                              "ລືມລະຫັດຜ່ານ",
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Launcher()),
                        // );
                        signIn(context);
                      },
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    TextButton(
                      onPressed: () {
                        _ButtonPressed(context);
                      },
                      child: const Text(
                        "..ສະໝັກສະມາຊິກ..",
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
                            onPressed: () async {
                              // var isAppInstalledResult =
                              await LaunchApp.openApp(
                                androidPackageName: 'com.android.linkedinIn',
                                //iosUrlScheme: 'facebook://',
                                openStore: true,
                              );
                              // print(
                              //     'isAppInstalledResult => $isAppInstalledResult ${isAppInstalledResult.runtimeType}');
                            },
                            icon: const Icon(
                              FontAwesomeIcons.linkedinIn,
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
      //print("signed in ${user}");
      checkAuth(context);
    }).catchError((error) {
      print(error.message);
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: Text(error.message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    });
  }

  Future checkAuth(BuildContext context) async {
    final User? user = await _auth.currentUser();
    print("Already singed-in with");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Launcher()));
  }
}

void _ButtonPressed(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    content: Text("coming soon", style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.red,
  ));
}
