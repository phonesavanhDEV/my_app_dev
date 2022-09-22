import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app_dev/menu/profile.dart';
//import 'package:timetable/todo_list.dart';

class About extends StatefulWidget {
  static const routeName = '/';

  const About({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutState();
  }
}

class _AboutState extends State<About> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  late String Name;
  late String price;
  late String type;

  late TextEditingController nameTextController;
  late TextEditingController priceTextController;
  late TextEditingController typeTextController;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    nameTextController = TextEditingController();
    priceTextController = TextEditingController();
    typeTextController = TextEditingController();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user as User;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    nameTextController.dispose();
    priceTextController.dispose();
    typeTextController.dispose();
    super.dispose();
  }

  void logout() {
    _auth.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '#ເພີ່ມສິນຄ້າ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'NotoSansLao',
                      color: Colors.blue,
                    ),
                  ),
                ),
                TextField(
                  controller: nameTextController,
                  onChanged: (value) {
                    Name = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'ຊື່ສິນຄ້າ',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: priceTextController,
                  onChanged: (value) {
                    price = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'ລາຄາ',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: typeTextController,
                  onChanged: (value) {
                    type = value;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'ປະເພດ',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  //controller: typeTextController,
                  onChanged: (value) {
                    type = value;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'xxxx',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  //controller: typeTextController,
                  onChanged: (value) {
                    type = value;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'xxxx',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  //controller: typeTextController,
                  onChanged: (value) {
                    type = value;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'xxxx',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  //controller: typeTextController,
                  onChanged: (value) {
                    type = value;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'xxxx',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Material(
                    // elevation: 5.0,
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'ເພີ່ມ',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NotoSansLao',
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        _fireStore.collection('productDetail').add({
                          'Name': Name,
                          'price': price,
                          'type': type,
                          //'sender': loggedInUser.email,
                        });
                        nameTextController.clear();
                        priceTextController.clear();
                        typeTextController.clear();
                      },
                    ),
                  ),
                ),
              ])),
    );
  }
}
