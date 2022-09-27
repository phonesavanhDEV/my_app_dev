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
  }

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
                .orderBy('DateE', descending: false)
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
                final _photo = (todoList.data() as dynamic)['Image'];

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
  final String name;
  final String price;
  final String type;
  final String description;
  final String DateM;
  final String DateE;
  final String Amount;
  final String createDate;
  final String photo;
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
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          )),
    );
  }
}
