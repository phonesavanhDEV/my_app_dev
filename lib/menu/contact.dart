import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContactState();
  }
}

class _ContactState extends State<Contact> {
  int _n = 0;

  void add() {
    setState(() {
      _n++;
    });
  }

  void remove() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('#add'),
        // onSearch: (value) => setState(() => searchValue = value),
      ),
      body: ListView(children: [
        Card(
          elevation: 10,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
              dense: false,
              //leading: Image.asset(''),
              title: Text('sss'),
              subtitle: Text('saaaa'),
              trailing: Wrap(
                spacing: 12,
                children: [
                  IconButton(
                    onPressed: add,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                  ),
                  new Text('$_n', style: new TextStyle(fontSize: 35.0)),
                  IconButton(
                    onPressed: remove,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // FirebaseFirestore.instance
                      //     .collection('productDetail')
                      //     .doc('$id')
                      //     .delete();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              )),
        )
      ]),
    );
  }
}
