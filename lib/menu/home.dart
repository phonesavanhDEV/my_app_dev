import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app_dev/login/index.dart';
import 'package:my_app_dev/menu/contact.dart';
import 'package:my_app_dev/qr_scanner/_qr_scan.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

final List<String> imgList = [
  'https://cdn.pixabay.com/photo/2022/08/05/05/59/korea-7366036__340.jpg',
  'https://cdn.pixabay.com/photo/2022/07/21/13/40/mongolian-girl-7336271__340.jpg',
  'https://cdn.pixabay.com/photo/2022/08/02/04/11/city-7359471__340.jpg',
  'https://cdn.pixabay.com/photo/2016/01/31/19/41/apple-1172060__340.jpg',
  'https://cdn.pixabay.com/photo/2020/09/14/10/45/spaceship-5570682__340.jpg',
  // 'assets/images/Jotun Nippon.jpg',
  // 'assets/images/Hitachi.jpg',
  // 'assets/images/Santa Monato.jpg',
  // 'assets/images/Vandi.jpg',
  // 'assets/images/Victoria Hamany.jpg',
  // 'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/Jotun_Nippon.jpeg',
  // 'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/Vandi.jpeg',
  // 'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/%E0%BA%81%E0%BA%B0%E0%BB%80%E0%BA%9A%E0%BA%B7%E0%BB%89%E0%BA%AD%E0%BA%87.jpeg',
  // 'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/Santa_Monato2.jpeg',
  // 'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/Victoria_Hamany21.jpeg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class _HomeState extends State<Home> {
  final _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
            child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            autoPlay: true,
          ),
          items: imageSliders,
        )),
        SingleChildScrollView(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          // color: Colors.orange[100],

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 280.0, left: 15),
                child: Container(
                  child: Text("#ເມນູ",
                      style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.blue[900],
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Row(children: [
                Container(
                  height: 100,
                  width: 70,
                  margin: EdgeInsets.only(left: 25.0),
                  padding: EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      // this is the shadow of the card
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0.5,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginApp()));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.userGroup,
                              color: Colors.red,
                              size: 35,
                            ),
                            // label: Text('ໜ້າຫຼັກ'),
                          ),
                          Text(
                            'ສະມາຊິກ',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 70,
                  margin: EdgeInsets.only(left: 12.0),
                  padding: EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      // this is the shadow of the card
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0.5,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              // FontAwesomeIcons.ca,
                              color: Colors.red,
                              size: 35,
                            ),
                            // label: Text('ໜ້າຫຼັກ'),
                          ),
                          Text(
                            'ສິນຄ້າ',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 70,
                  margin: EdgeInsets.only(left: 12.0),
                  padding: EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      // this is the shadow of the card
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0.5,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check_box_rounded,
                              color: Colors.red,
                              size: 35,
                            ),
                            // label: Text('ໜ້າຫຼັກ'),
                          ),
                          Text(
                            'ສະຖານະ',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 70,
                  margin: EdgeInsets.only(left: 12.0),
                  padding: EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      // this is the shadow of the card
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0.5,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRViewExample()));
                            },
                            icon: const Icon(
                              Icons.qr_code_2_rounded,
                              color: Colors.red,
                              size: 35,
                            ),
                            // label: Text('ໜ້າຫຼັກ'),
                          ),
                          Text(
                            'ສະແກນQR',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(right: 220.0, left: 12, top: 15),
                child: Container(
                  child: Text("#hightlight",
                      style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.red[900],
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 16.0, top: 20.0),
              //   child: Text("ສິນຄ້າ",
              //       style: TextStyle(
              //         color: Colors.blue[900],
              //         fontFamily: 'NotoSansLao',
              //         fontSize: 24.0,
              //       )),
              // ),
              Container(
                constraints: BoxConstraints(
                    minHeight: 100, minWidth: double.infinity, maxHeight: 300),
                child: Row(
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
                          final _descript =
                              (todoList.data() as dynamic)['description'];
                          final _dateM = (todoList.data() as dynamic)['DateM'];
                          final _dateE = (todoList.data() as dynamic)['DateE'];
                          final _amount =
                              (todoList.data() as dynamic)['Amount'];
                          final _createDate =
                              (todoList.data() as dynamic)['createDate'];
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
                            child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 8.0,
                                children: todoWidgets),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    )));
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

  // int _n = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: new InkWell(
            onTap: () {
              print("$name");
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Contact()));
              //showModalBottomSheet
              //mainAxisSize: MainAxisSize.min,
              //showDialog
              // showCupertinoModalPopup(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return AlertDialog(
              //         scrollable: true,
              //         title: Text('Order'),
              //         content: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Form(
              //             child: Column(
              //               children: <Widget>[
              //                 Text('Name:$name'),
              //                 Text('Price:$price'),
              //                 Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceEvenly,
              //                     children: [
              //                       new FloatingActionButton(
              //                         onPressed: () {},
              //                         child: new Icon(
              //                           Icons.add,
              //                           color: Colors.black,
              //                         ),
              //                         backgroundColor: Colors.white,
              //                       ),
              //                       new Text('',
              //                           style: new TextStyle(fontSize: 60.0)),
              //                       new FloatingActionButton(
              //                         onPressed: () {},
              //                         child: new Icon(
              //                           Icons.minor_crash_outlined,
              //                           color: Colors.black,
              //                         ),
              //                         backgroundColor: Colors.white,
              //                       ),
              //                     ])
              //               ],
              //             ),
              //           ),
              //         ),
              //         actions: [
              //           TextButton(
              //               child: Text("Submit"),
              //               onPressed: () {
              //                 // your code
              //               })
              //         ],
              //       );
              //     });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  // this is the shadow of the card
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.5,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 125,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(15.0),
                      child: Image.network('$photo', fit: BoxFit.fill),
                    ),
                  ),
                  Text('Name:$name'),
                  Text('Price:$price'),
                  // TextButton(
                  //   child: const Text('Like'),
                  //   onPressed: () {/* ... */},
                  // ),
                ],
              ),
            )));
  }
}
