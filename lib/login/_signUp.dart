import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/login/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MySignUpPage extends StatefulWidget {
  MySignUpPage({Key? key}) : super(key: key);

  @override
  _MySignUpPageState createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool _isHidden = true;
  bool _isHidden1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        // appBar: AppBar(
        //   title: Text("ສະໝັກສະມາຊິກ",
        //       style: TextStyle(fontFamily: 'NotoSansLao', color: Colors.white)),
        // ),
        body: SingleChildScrollView(
            // color: Colors.green[250],
            child: Center(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.purpleAccent,
                        Colors.amber,
                        Colors.blue,
                      ])),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 440,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "#ສະໝັກສະມາຊິກ",
                            style: TextStyle(
                                fontFamily: 'NotoSansLao',
                                fontSize: 28,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          buildTextFieldEmail(),
                          buildTextFieldPassword(),
                          buildTextFieldPasswordConfirm(),
                          buildButtonSignUp(context)
                        ]),
                  )
                ],
              )),
        )));
  }

  Widget buildButtonSignUp(BuildContext context) {
    return InkWell(
        child: Container(
            constraints: BoxConstraints.expand(height: 50, width: 150),
            child: Text("ຕົກລົງ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'NotoSansLao',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepOrange,
                      Colors.orange,
                      Colors.blue,
                    ])),
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(12)),
        onTap: () => signUp());
  }

  Container buildTextFieldEmail() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(),
      // color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      // child: TextField(
      //     controller: emailController,
      //     decoration: InputDecoration.collapsed(
      //       hintText: "ອີເມວ",
      //     ),
      //     keyboardType: TextInputType.emailAddress,
      //     style: TextStyle(
      //       fontFamily: 'NotoSansLao',
      //       fontSize: 18,
      //       fontWeight: FontWeight.normal,
      //     ))
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
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
      ),
    );
  }

  Container buildTextFieldPassword() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(),
      // child: TextField(
      //     controller: passwordController,
      //     obscureText: true,
      //     decoration: InputDecoration.collapsed(hintText: "ລະຫັດຜ່ານ"),
      //     style: TextStyle(
      //       fontFamily: 'NotoSansLao',
      //       fontSize: 18,
      //       fontWeight: FontWeight.normal,
      //     ))
      child: TextField(
        controller: passwordController,
        obscureText: _isHidden,
        decoration: InputDecoration(
            suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _isHidden ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  color: Colors.red,
                )),
            labelText: "ລະຫັດຜ່ານ",
            labelStyle: TextStyle(
              fontFamily: 'NotoSansLao',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
      ),
    );
  }

  Container buildTextFieldPasswordConfirm() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(),
      // child: TextField(
      //     controller: confirmController,
      //     obscureText: true,
      //     decoration: InputDecoration.collapsed(hintText: "ຢືນຢັນລະຫັດ"),
      //     style: TextStyle(
      //       fontFamily: 'NotoSansLao',
      //       fontSize: 18,
      //       fontWeight: FontWeight.normal,
      //     ))

      child: TextField(
        controller: confirmController,
        obscureText: _isHidden1,
        decoration: InputDecoration(
            suffix: InkWell(
                onTap: _togglePasswordView1,
                child: Icon(
                  _isHidden1 ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  color: Colors.red,
                )),
            labelText: "ຢືນຢັນລະຫັດ",
            labelStyle: TextStyle(
              fontFamily: 'NotoSansLao',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  signUp() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmController.text.trim();
    if (password == confirmPassword && password.length >= 6) {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginApp()),
            ModalRoute.withName('/'));
        ;
      }).catchError((error) {
        // print(error.message);
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: Text(error.message, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ));
      });
    } else {
      // print("Password and Confirm-password is not match.");
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: Text("Password and Confirm-password is not match.",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    }
  }
}
