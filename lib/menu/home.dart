import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                            onPressed: () {},
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
                            onPressed: () {},
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
                height: 200,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              'https://cdn.pixabay.com/photo/2022/08/05/05/59/korea-7366036__340.jpg'),
                          Text(
                            "ຊື່ສິນຄ້າ:.....",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "ລາຄາ:.....",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              'https://cdn.pixabay.com/photo/2022/08/02/04/11/city-7359471__340.jpg'),
                          Text(
                            "ຊື່ສິນຄ້າ:.....",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "ລາຄາ:.....",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              'https://cdn.pixabay.com/photo/2020/09/14/10/45/spaceship-5570682__340.jpg'),
                          Text(
                            "ຊື່ສິນຄ້າ:.....",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "ລາຄາ:.....",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              'https://cdn.pixabay.com/photo/2016/01/31/19/41/apple-1172060__340.jpg'),
                          Text(
                            "ຊື່ສິນຄ້າ:.....",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "ລາຄາ:.....",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSansLao',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
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
