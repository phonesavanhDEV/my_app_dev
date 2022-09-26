// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                final img =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  _image = img;
                });
              },
              label: const Text('choose image'),
              icon: const Icon(Icons.image),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                final img = await _picker.pickImage(source: ImageSource.camera);
                setState(() {
                  _image = img;
                });
              },
              label: const Text('Take Photo'),
              icon: const Icon(Icons.camera_alt_outlined),
            ),
          ],
        ),
        if (_image != null)
          Expanded(
              child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  child: Image.file(
                      fit: BoxFit.fill,
                      height: 150.0,
                      // width: 150.0,
                      File(_image!.path))),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _image = null; //this is important
                  });
                },
                label: const Text('Remove Image'),
                icon: const Icon(Icons.close),
              )
            ],
          ))
        else
          const SizedBox(),
      ],
    ));
  }
}
