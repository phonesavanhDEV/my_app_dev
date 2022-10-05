import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  static const routeName = '/';

  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String searchName = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search Name...'),
              onChanged: (val) {
                setState(() {
                  searchName = val;
                });
              },
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            ///
            stream: (searchName != "" && searchName != null)
                ? _fireStore
                    .collection('productDetail')
                    // .orderBy('Name', descending: false)
                    .where(
                      'Name',
                      isGreaterThanOrEqualTo: searchName,
                    )
                    .where(
                      'Name',
                      isLessThan: searchName + 'z',
                    )
                    .snapshots()
                : _fireStore.collection('productDetail').snapshots(),

            ///flutter aysnc snapshot
            builder: (context, snapshot) {
              List<MessageBubble> todoWidgets = [];

              //if (snapshot.connectionState == ConnectionState.done &&
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                      // backgroundColor: Colors.lightBlueAccent,
                      ),
                );
              }

              final todoLists = snapshot.data!.docs;

              for (var todoList in todoLists) {
                final _id = (todoList.data() as dynamic)['id'];
                final _name = (todoList.data() as dynamic)['Name'];

                final _price = (todoList.data() as dynamic)['price'];

                final _type = (todoList.data() as dynamic)['type'];
                final _descript = (todoList.data() as dynamic)['description'];
                final _dateM = (todoList.data() as dynamic)['DateM'];
                final _dateE = (todoList.data() as dynamic)['DateE'];
                final _amount = (todoList.data() as dynamic)['Amount'];
                final _createDate = (todoList.data() as dynamic)['createDate'];
                final _photo = (todoList.data() as dynamic)['Image'];

                final messageWidget = MessageBubble(
                  id: '$_id',
                  name: '$_name',
                  //isLoggedIn: currentUser == loggedIn,
                  price: '$_price',
                  type: '$_type',
                  description: '$_descript',
                  DateM: '$_dateM',
                  DateE: '$_dateE',
                  Amount: '$_amount',
                  createDate: '$_createDate',
                  photo: '$_photo',
                );

                todoWidgets.add(messageWidget);
              }

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(children: todoWidgets),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
    required this.description,
    required this.DateM,
    required this.DateE,
    required this.Amount,
    required this.createDate,
    required this.photo,
  });
  final String id;
  final String name;
  final String price;
  final String type;
  final String description;
  final String DateM;
  final String DateE;
  final String Amount;
  final String createDate;
  final String photo;
  late String nameEdit;
  late String priceEdit;
  late String typeEdit;
  late String descriptionEdit;
  late String amountEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
          dense: false,
          leading: Image.network('$photo'),
          title: Text('$name'),
          subtitle: Text('$price'),
          trailing: Wrap(
            spacing: 12,
            children: [
              IconButton(
                onPressed: () {
                  showGet(context);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('productDetail')
                      .doc('$id')
                      .delete();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          )),
    );
  }

  showGet(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Edit'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Text(
                      'id:',
                    ),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(text: "$id"),
                      //controller: $name,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // hintText: '$name',
                        // hintStyle: TextStyle(
                        //   fontSize: 18,
                        //   fontFamily: 'NotoSansLao',
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      //keyboardType: TextInputType.number,
                    ),
                    Text(
                      'Name:',
                    ),
                    TextField(
                      controller: TextEditingController(text: "$name"),
                      //controller: nameEdit,
                      onChanged: (value) {
                        nameEdit = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // hintText: '$name',
                        // hintStyle: TextStyle(
                        //   fontSize: 18,
                        //   fontFamily: 'NotoSansLao',
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      //keyboardType: TextInputType.number,
                    ),
                    Text('price:'),
                    TextField(
                      controller: TextEditingController(text: "$price"),
                      onChanged: (value) {
                        priceEdit = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // hintText: '$type',
                        // hintStyle: TextStyle(
                        //   fontSize: 18,
                        //   fontFamily: 'NotoSansLao',
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      //keyboardType: TextInputType.number,
                    ),
                    Text('type:'),
                    TextField(
                      controller: TextEditingController(text: "$type"),
                      onChanged: (value) {
                        typeEdit = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // hintText: '$type',
                        // hintStyle: TextStyle(
                        //   fontSize: 18,
                        //   fontFamily: 'NotoSansLao',
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      //keyboardType: TextInputType.number,
                    ),
                    Text('description:'),
                    TextField(
                      controller: TextEditingController(text: "$description"),
                      onChanged: (value) {
                        descriptionEdit = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // hintText: '$description',
                        // hintStyle: TextStyle(
                        //   fontSize: 18,
                        //   fontFamily: 'NotoSansLao',
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      //keyboardType: TextInputType.number,
                    ),
                    // Text('DateM:'),

                    // TextField(
                    //   readOnly: true,
                    //   controller: TextEditingController(text: "$DateM"),

                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //     ),
                    //   ),
                    //   //keyboardType: TextInputType.number,
                    // ),
                    // Text('DateE:'),
                    // TextField(
                    //   readOnly: true,
                    //   controller: TextEditingController(text: "$DateE"),

                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //     ),
                    //   ),
                    //   //keyboardType: TextInputType.number,
                    // ),
                    Text('Amount:'),
                    TextField(
                      controller: TextEditingController(text: "$Amount"),
                      onChanged: (value) {
                        amountEdit = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // hintText: '$Amount',
                        // hintStyle: TextStyle(
                        //   fontSize: 18,
                        //   fontFamily: 'NotoSansLao',
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    // Text('Image:'),
                    // TextField(
                    //   //controller: amountTextController,
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     hintText: '$photo',
                    //     hintStyle: TextStyle(
                    //       fontSize: 18,
                    //       fontFamily: 'NotoSansLao',
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //     ),
                    //   ),
                    //   //keyboardType: TextInputType.number,
                    // ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  child: Text("Submit"),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('productDetail')
                        .doc('$id')
                        .update({
                      'Name': nameEdit,
                      'price': priceEdit,
                      'type': typeEdit,
                      'description': description,
                      'DateM': DateM,
                      'DateE': DateE,
                      'Amount': amountEdit,
                      'createDate': DateTime.now(),
                      'Image': photo,
                    });
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
