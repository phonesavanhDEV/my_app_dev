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

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ໜ້າຫຼັກ'),
      ),
      body: CarouselSlider(
          items: null,
          carouselController: null,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        ),
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
