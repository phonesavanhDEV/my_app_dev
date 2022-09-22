import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app_dev/login/index.dart';

class MyPhonePage extends StatefulWidget {
  MyPhonePage({Key? key}) : super(key: key);

  @override
  _MyPhonePage createState() => _MyPhonePage();
}

class _MyPhonePage extends State<MyPhonePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phoneController = TextEditingController();
  TextEditingController smsController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late String _verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "#ສະໝັກສະມາຊິກຜ່ານເບີໂທ",
                            style: TextStyle(
                                fontFamily: 'NotoSansLao',
                                fontSize: 24,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(12),
                                child: Text("+856",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black54))),
                            Expanded(child: buildTextFieldPhone()),
                            buildButtonSendSms()
                          ]),
                          buildTextFieldSmsVerification(),
                          buildButtonSignUp(context),
                        ]),
                  )
                ],
              )),
        )));
  }

  Widget buildButtonSendSms() {
    return InkWell(
        child: Container(
            height: 50,
            width: 80,
            child: Text("ສົ່ງ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.orange[300]),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(right: 5)),
        onTap: () => requestVerifyCode());
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
      onTap: () => verifyPhone(),
    );
  }

  Container buildTextFieldSmsVerification() {
    return Container(
      padding: EdgeInsets.all(12),
      child: TextField(
        controller: smsController,
        decoration: InputDecoration(
            labelText: "SMS verification",
            labelStyle: TextStyle(
              fontFamily: 'NotoSansLao',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Container buildTextFieldPhone() {
    return Container(
      padding: EdgeInsets.all(12),
      child: TextField(
        controller: phoneController,
        decoration: InputDecoration(
            labelText: "ເບີໂທ",
            labelStyle: TextStyle(
              fontFamily: 'NotoSansLao',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  requestVerifyCode() {
    _auth.verifyPhoneNumber(
        phoneNumber: "+865" + phoneController.text.trim(),
        timeout: const Duration(seconds: 1),
        verificationCompleted: (PhoneAuthCredential credential) {
          //
        },
        verificationFailed: (error) {
          print(
              'Phone number verification failed. Code: ${error.code}. Message: ${error.message}');
        },
        codeSent: (verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (verificationId) {
          //
        });
  }

  verifyPhone() async {
    //  final User user = await _auth.signInWithCredential(PhoneAuthProvider.getCredential(
    //     verificationId: _verificationId, smsCode: smsController.text));

    // navigateToHomepage(context);
  }

  void navigateToHomepage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginApp()),
        ModalRoute.withName('/'));
  }
}
