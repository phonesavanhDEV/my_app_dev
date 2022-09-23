import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    //getCurrentUser();
  }

  // void getCurrentUser() async {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ໂປຣໄຟຣ'),
      // ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            ///
            stream: _fireStore
                .collection('productDetail')
                .orderBy('Name', descending: false)
                .snapshots(),

            ///flutter aysnc snapshot
            builder: (context, snapshot) {
              List<MessageBubble> todoWidgets = [];
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              }
              final todoLists = snapshot.data!.docs;

              for (var todoList in todoLists) {
                final _name = (todoList.data() as dynamic)['Name'];

                final _price = (todoList.data() as dynamic)['price'];

                final _type = (todoList.data() as dynamic)['type'];
                final _descript = (todoList.data() as dynamic)['description'];
                final _dateM = (todoList.data() as dynamic)['DateM'];
                final _dateE = (todoList.data() as dynamic)['DateE'];
                final _amount = (todoList.data() as dynamic)['Amount'];
                final _createDate = (todoList.data() as dynamic)['createDate'];

                final messageWidget = MessageBubble(
                  name: '$_name',
                  //isLoggedIn: currentUser == loggedIn,
                  price: '$_price',
                  type: '$_type',
                  description: '$_descript',
                  DateM: '$_dateM',
                  DateE: '$_dateE',
                  Amount: '$_amount',
                  createDate: '$_createDate',
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
    required this.name,
    required this.price,
    required this.type,
    required this.description,
    required this.DateM,
    required this.DateE,
    required this.Amount,
    required this.createDate,
  });
  final String name;
  final String price;
  final String type;
  final String description;
  final String DateM;
  final String DateE;
  final String Amount;
  final String createDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            children: [
              Text('$DateE',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30.0, color: Colors.black)),
            ],
          ),
          Material(
              elevation: 5.0,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
              color: Colors.lightBlueAccent,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$name',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$Amount',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$price',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              )),
                        ),
                      ])))
        ]));
  }
}
