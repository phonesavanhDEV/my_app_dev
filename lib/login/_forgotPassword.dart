import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/login/index.dart';

class MyforgotPassword extends StatefulWidget {
  MyforgotPassword({Key? key}) : super(key: key);

  @override
  _MyforgotPassword createState() => _MyforgotPassword();
}

class _MyforgotPassword extends State<MyforgotPassword> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        // appBar: AppBar(
        //   title: Text("Reset password", style: TextStyle(color: Colors.white)),
        //   iconTheme: IconThemeData(
        //     color: Colors.white, //change your color here
        //   ),
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
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "#ລືມລະຫັດຜ່ານ",
                            style: TextStyle(
                                fontFamily: 'NotoSansLao',
                                fontSize: 28,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          buildTextFieldEmail(),
                          buildButtonSignUp(context),
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
      onTap: resetPassword,
    );
  }

  Container buildTextFieldEmail() {
    return Container(
      padding: EdgeInsets.all(12),
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

  Future resetPassword() async {
    try {
      String _email = emailController.text.trim();
      _auth.sendPasswordResetEmail(email: _email);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginApp()),
          ModalRoute.withName('/'));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("We send the detail to $_email successfully.",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[300],
      ));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
