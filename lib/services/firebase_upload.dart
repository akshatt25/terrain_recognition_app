import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<String> uploadImageToFirebase(
    String imagePath, String contentType) async {
  try {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Create a reference to the Firebase Storage bucket
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}');

    // Create a File object from the provided image path
    File imageFile = File(imagePath);

    // Specify the content type using SettableMetadata
    SettableMetadata metadata = SettableMetadata(contentType: contentType);

    // Upload the file to Firebase Storage with metadata
    await storageReference.putFile(imageFile, metadata);
    String imageUrl = await storageReference.getDownloadURL();

    print('Image uploaded successfully!');
    Fluttertoast.showToast(msg: 'Image Uploaded');
    String encodedUrl = Uri.encodeComponent(imageUrl);

    return encodedUrl;
  } catch (e) {
    print('Error uploading image: $e');
    Fluttertoast.showToast(msg: 'Failed, Try Again!');
    return '';
  }
}
