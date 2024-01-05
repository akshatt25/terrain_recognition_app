import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<String> takeImage() async {
  String imagePath = '';
  try {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imagePath = pickedFile.path;
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return imagePath;
}
