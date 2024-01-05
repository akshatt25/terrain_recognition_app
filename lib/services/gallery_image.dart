import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<String> pickImage() async {
  String imagePath = '';
  try {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = pickedFile.path;
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return imagePath;
}

// Future<File> getImage() async {
//   File image;
//   try {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return image;
// }
