import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicket extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;

  UserImagePicket(this.imagePickFn);

  @override
  _UserImagePicketState createState() => _UserImagePicketState();
}

class _UserImagePicketState extends State<UserImagePicket> {
  File _pickedImage;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
        source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
          backgroundColor: Colors.grey,
        ),
        FlatButton.icon(
          onPressed: _pickImage,
          textColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}
