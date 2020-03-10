import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class InputImage extends StatefulWidget {
  final Function onSelectImage;

  InputImage(this.onSelectImage);

  @override
  _InputImageState createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {


  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey)
          ),
          child: _storedImage != null ? Image.file(_storedImage, fit: BoxFit.cover, width: double.infinity,) : Text('pas dimage'),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10,),
        Expanded(
          child: FlatButton.icon(onPressed: () {
            _takePicture();
          },
              icon: Icon(Icons.camera),
              label: Text('Prendre une photo'),
            textColor: Theme.of(context).primaryColor,
          )
        )
      ],
    );
  }
}
