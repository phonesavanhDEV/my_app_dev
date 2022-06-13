import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'home.dart';
import 'contact.dart';
import 'profile.dart';
import 'about.dart';
import 'settings.dart';

class Launcher extends StatefulWidget {
  static const routeName = '/';

  const Launcher({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  String searchValue = '';
  int _selectedIndex = 0;
  final List<Widget> _pageWidget = <Widget>[
    const Home(),
    const About(),
    const Profile(),
    const Contact(),
    const Settings(),
  ];
  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.home),
      label: 'ໜ້າຫຼັກ',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.infoCircle),
      label: 'ກ່ຽວກັບ',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.userAlt),
      label: 'ໂປຣໄຟຣ',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.addressCard),
      label: 'ຕິດຕໍ່',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.cog),
      label: 'ຕັ່ງຄ່າ',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Home"),
              accountEmail: Text("phonesavanh@gamil.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/new_logo.png'),
                // backgroundImage: NetworkImage(
                //     "https://scontent.fbkk10-1.fna.fbcdn.net/v/t1.6435-9/118874943_3472399469478138_4332737009688307690_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGl-eWBoJyWxFHxUn3-m165oWr_wv-6EWGhav_C_7oRYechsZE9nfX5Q4emUJdrwmZbmzfO3sQgPmIL0ZVR0fIm&_nc_ohc=7U5rHKnENYIAX_lXO5g&_nc_ht=scontent.fbkk10-1.fna&oh=00_AT8mrTl1ntnFKUkeJGYF5f6KN0xX0k6KPJE28ok4Jb-cMg&oe=62CA9C74"),
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/images/bg01.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "ໜ້າຫຼັກ",
                style: TextStyle(fontFamily: 'NotoSansLao'),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                "ກ່ຽວກັບ",
                style: TextStyle(fontFamily: 'NotoSansLao'),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.grid_3x3_outlined),
              title: Text(
                "ສິນຄ້າ",
                style: TextStyle(fontFamily: 'NotoSansLao'),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text(
                "ຕິດຕໍ່",
                style: TextStyle(fontFamily: 'NotoSansLao'),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: EasySearchBar(
        title: Text(''),
        onSearch: (value) => setState(() => searchValue = value),
      ),
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    ));
  }
}
