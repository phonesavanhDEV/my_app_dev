import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
