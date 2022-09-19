import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}
