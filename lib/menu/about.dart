import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:timetable/todo_list.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  late String description;
  // DateTime? DateM;
  // DateTime? DateE;
  late String Amount;
  XFile? _image;
  late TextEditingController nameTextController;
  late TextEditingController priceTextController;
  late TextEditingController typeTextController;
  late TextEditingController descriptionTextController;
  late TextEditingController dateMTextController;
  late TextEditingController dateETextController;
  late TextEditingController amountTextController;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    nameTextController = TextEditingController();
    priceTextController = TextEditingController();
    typeTextController = TextEditingController();
    descriptionTextController = TextEditingController();
    dateMTextController = TextEditingController();
    dateETextController = TextEditingController();
    amountTextController = TextEditingController();
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
    descriptionTextController.dispose();
    dateMTextController.dispose();
    dateETextController.dispose();
    amountTextController.dispose();
    super.dispose();
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
                  controller: descriptionTextController,
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'ລາຍລະອຽດ',
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
                // CupertinoButton(
                //   padding: EdgeInsetsDirectional.zero,
                //   child: const Text('Show Picker'),
                //   onPressed: () => _showDatePicker(context),
                // ),
                TextField(
                  readOnly: true,
                  controller: dateMTextController,
                  // onChanged: (value) {
                  //   DateM = DateTime.parse(value.toString());
                  // },
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(9999),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(pickedDate);

                      setState(() {
                        dateMTextController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'ວັນທີ່ຜະລິດ',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  //keyboardType: TextInputType.datetime,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  readOnly: true,
                  controller: dateETextController,
                  // onChanged: (value) {
                  //   DateE = DateTime.parse(value.toString());

                  // },
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(9999),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(pickedDate);

                      setState(() {
                        dateETextController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'ວັນທີ່ໝົດອາຍຸ',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  // keyboardType: TextInputType.datetime,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: amountTextController,
                  onChanged: (value) {
                    Amount = value;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'ຈຳນວນ',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansLao',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 8.0,
                ),
                if (_image != null)
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 300,
                      width: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Image.file(
                              fit: BoxFit.fill,
                              height: 150.0,
                              // width: 150.0,
                              File(_image!.path))),
                    ),
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        final img = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          _image = img;
                        });
                      },
                      label: const Text(
                        'ເລືອກ',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'NotoSansLao',
                            color: Colors.white),
                      ),
                      icon: const Icon(Icons.image),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        final img =
                            await _picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          _image = img;
                        });
                      },
                      label: const Text(
                        'ກ້ອງ',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'NotoSansLao',
                            color: Colors.white),
                      ),
                      icon: const Icon(Icons.camera_alt_outlined),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _image = null; //this is important
                        });
                      },
                      label: const Text(
                        'ລຶບ',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'NotoSansLao',
                            color: Colors.white),
                      ),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                // if (_image != null)
                //   Expanded(child: Image.file(File(_image!.path)))
                // else
                //   const SizedBox(),

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
                          'description': description,
                          'DateM': dateMTextController.text,
                          'DateE': dateETextController.text,
                          'Amount': Amount,
                          'createDate': DateTime.now(),
                          //'sender': loggedInUser.email,
                        });
                        nameTextController.clear();
                        priceTextController.clear();
                        typeTextController.clear();
                        descriptionTextController.clear();
                        dateETextController.clear();
                        dateMTextController.clear();
                        amountTextController.clear();
                      },
                    ),
                  ),
                ),
              ])),
    );
  }
}
