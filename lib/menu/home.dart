import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

final List<String> imgList = [
  'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/Jotun_Nippon.jpeg',
  'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/Vandi.jpeg',
  'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/%E0%BA%81%E0%BA%B0%E0%BB%80%E0%BA%9A%E0%BA%B7%E0%BB%89%E0%BA%AD%E0%BA%87.jpeg',
  'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/Santa_Monato2.jpeg',
  'https://www.souvanny.la/administrator/assets/slide_image/image_show_resize/Victoria_Hamany21.jpeg',
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
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    // const drawerHeader = DrawerHeader(
    //   decoration: BoxDecoration(
    //       color: Colors.deepOrange,
    //       image: DecorationImage(
    //           image: AssetImage("assets/images/Jotun Nippon.jpg"),
    //           fit: BoxFit.cover)),
    // );
    // return MaterialApp(
    //     title: 'Example',
    //     theme: ThemeData(primarySwatch: Colors.deepOrange),
    //     home: Scaffold(
    //       appBar: EasySearchBar(
    //         title: Text(''),
    //         onSearch: (value) => setState(() => searchValue = value),
    //       ),
    //       drawer: Drawer(
    //           child: ListView(padding: EdgeInsets.zero, children: [
    //         const SizedBox(height: 300, child: drawerHeader),
    //         DrawerHeader(child : Stack(
    //           children: [
    //             Positioned(
    //               bottom: 8.0,
    //               left: 4.0,
    //               child: Text("HomeCenter"),
    //             )
    //           ],)),

    //         ListTile(
    //             title: const Text('Item 1'),
    //             onTap: () => Navigator.pop(context)),
    //         ListTile(
    //             title: const Text('Item 2'),
    //             onTap: () => Navigator.pop(context))
    //       ])),
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Home"),
              accountEmail: Text("phonesavanh@gamil.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://scontent.fbkk10-1.fna.fbcdn.net/v/t1.6435-9/118874943_3472399469478138_4332737009688307690_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGl-eWBoJyWxFHxUn3-m165oWr_wv-6EWGhav_C_7oRYechsZE9nfX5Q4emUJdrwmZbmzfO3sQgPmIL0ZVR0fIm&_nc_ohc=7U5rHKnENYIAX_lXO5g&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT8mrTl1ntnFKUkeJGYF5f6KN0xX0k6KPJE28ok4Jb-cMg&oe=62CA9C74"),
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.grid_3x3_outlined),
              title: Text("Products"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact"),
              onTap: () {},
            )
          ],
        ),
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
