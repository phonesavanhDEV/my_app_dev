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
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/286652239_5411721438879255_3031922985482567153_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=0debeb&_nc_eui2=AeG3abLqpdXd4JW-azJng3MoTD5nWz0z0LdMPmdbPTPQt3ID5ce39eb0y_wpUroZf-9XXrK9vETmh4eE2PBVt8MW&_nc_ohc=WjogHyBqsbAAX_cYfjE&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT-55RuRtBODw7_u6JgbnD4AoGHkp9n3sMaQqJMhlZt1dw&oe=62A5A18B',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279941072_5308992022485531_2778414401257269760_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=0debeb&_nc_eui2=AeFedTLxJHf5zCTMIPuxeBkTVcXHl2Z0OspVxceXZnQ6ynGAO3RND_h2ojEtXqvIIk02ZMOurEI4_kpzOiMCWzr8&_nc_ohc=YWg6ZYtjDUMAX-cuz0U&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT92k69E_n4C3hpPrPvfWwZjUxRDiceSMnI67qLIocjXqQ&oe=62A614E7',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279526048_5294967070554693_8340271032353804313_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_eui2=AeGU-JAx_cfL-uQrjJjCWA4pE74CpO1W8fYTvgKk7Vbx9v5GmLGlmcclNhrXeIcazOxZudkrtTDf3_ebtixX3b6D&_nc_ohc=ERaIlf2H-ZcAX-NYr31&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT_fXbCV0EdJCGFj4k7GeQ9jB4kdtZtVHSr137UHspTczg&oe=62A6F970',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279190864_5281163905268343_5533048733329608345_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=0debeb&_nc_eui2=AeEELY_DxEP9eEGKAbf5EVKxHGMqOhEZbp4cYyo6ERlunlLrDGpABmzRTBecFfucoRIFdVsO4Vu4U_VnF7cGTQph&_nc_ohc=qaVShjv55hAAX_I6gS7&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT9xdxMaMr7FpO7-Txs1AdvgDAvvlHZP9qSKXIVttDxJVg&oe=62A776A3',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/279235793_5281187148599352_7639851043119958838_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_eui2=AeFeTk0znMMnfdQEaz1Rzu5KwaK6H9G2TuTBorof0bZO5Jhk23WoUt-uCt5BrVgQkyHQnW3HJltQPvfIIShcfmdU&_nc_ohc=o-4iAS6pC1IAX9s_CE7&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT9UnsErZ1B4loahzIqlWQAmp_uDLFzrPzoSqWj5g2WRNQ&oe=62A5FB15',
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


