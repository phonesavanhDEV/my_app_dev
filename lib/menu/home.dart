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
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279257190_5281010535283680_8152532861226063376_n.png?_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=oQJPeRW3vvIAX_GV8Hl&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT8ZJy2HZtQwp5w4rfFXyWcJPCByTQ1KKE7KLSz49eTBmA&oe=62A5C7B3',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279257190_5281010535283680_8152532861226063376_n.png?_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=oQJPeRW3vvIAX_GV8Hl&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT8ZJy2HZtQwp5w4rfFXyWcJPCByTQ1KKE7KLSz49eTBmA&oe=62A5C7B3',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279257190_5281010535283680_8152532861226063376_n.png?_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=oQJPeRW3vvIAX_GV8Hl&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT8ZJy2HZtQwp5w4rfFXyWcJPCByTQ1KKE7KLSz49eTBmA&oe=62A5C7B3',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279257190_5281010535283680_8152532861226063376_n.png?_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=oQJPeRW3vvIAX_GV8Hl&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT8ZJy2HZtQwp5w4rfFXyWcJPCByTQ1KKE7KLSz49eTBmA&oe=62A5C7B3',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279257190_5281010535283680_8152532861226063376_n.png?_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=oQJPeRW3vvIAX_GV8Hl&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT8ZJy2HZtQwp5w4rfFXyWcJPCByTQ1KKE7KLSz49eTBmA&oe=62A5C7B3',
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
      appBar: AppBar(
        title: Text('ໜ້າຫຼັກ'),
      ),
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


// class _HomeState extends State<Home> {
//   CarouselController buttonCarouselController = CarouselController();

//   @override
//   Widget build(BuildContext context) => Column(children: <Widget>[
//         CarouselSlider(
//           items: null,
//           carouselController: buttonCarouselController,
//           options: CarouselOptions(
//             autoPlay: false,
//             enlargeCenterPage: true,
//             viewportFraction: 0.9,
//             aspectRatio: 2.0,
//             initialPage: 2,
//           ),
//         ),
//         RaisedButton(
//           onPressed: () => buttonCarouselController.nextPage(
//               duration: Duration(milliseconds: 300), curve: Curves.linear),
//           child: Text('→'),
//         )
//       ]);
// }
