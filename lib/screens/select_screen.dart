import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:terrain_recognition/screens/prediction_screen.dart';
import 'package:terrain_recognition/services/api_call.dart';
import 'package:terrain_recognition/services/camera_image.dart';
import 'package:terrain_recognition/services/firebase_upload.dart';
import '../constants/terrain_data.dart';
import '../services/gallery_image.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String _imagePath = '';
  String _imageUrl = '';
  bool isUploading = false;

  void selectImage() async {
    var res = await pickImage();
    setState(() {
      _imageUrl = "";
      if (res != '') _imagePath = res;
    });
  }

  void captureImage() async {
    var res = await takeImage();
    setState(() {
      _imageUrl = "";
      if (res != '') _imagePath = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Scaffold(
          backgroundColor: Colors.black54,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text('Terrain Recognitin'),
            centerTitle: true,
          ),
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                //imageBox
                child: _imagePath == ''
                    ? Positioned(
                        top: 250,
                        bottom: 350,
                        child: SizedBox(
                          height: 175,
                          width: 250,
                          child: GestureDetector(
                            onTap: () async {
                              selectImage();
                            },
                            child: DottedBorder(
                              color: Colors.white,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [10, 4],
                              strokeWidth: 1.5,
                              strokeCap: StrokeCap.round,
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(35, 30, 136, 229),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.folder_open_outlined,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('Select Product Images',
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: 350,
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(
                              File(_imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
              ),
              Positioned(
                bottom: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(190, 30, 136, 229))),
                        onPressed: () {
                          captureImage();
                        },
                        child: const Text(
                          'Camera',
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(190, 30, 136, 229))),
                        onPressed: () {
                          selectImage();
                        },
                        child: const Text(
                          'Gallery',
                        )),
                  ],
                ),
              ),
              //main button
              Container(
                child: _imagePath == ''
                    ? const Positioned(top: 0, child: SizedBox())
                    : Positioned(
                        bottom: 50,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: _imageUrl == ''
                                ? () async {
                                    setState(() {
                                      isUploading = true;
                                    });
                                    _imageUrl = await uploadImageToFirebase(
                                        _imagePath, 'image/jpeg');
                                    setState(() {
                                      isUploading = false;
                                    });
                                    print(_imageUrl);
                                  }
                                : () async {
                                    setState(() {
                                      isUploading = true;
                                    });
                                    String res = await getPrediction(_imageUrl);
                                    print(res);
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PredictionScreen(
                                                  imagePath: _imagePath,
                                                  terrainType: res,
                                                )));
                                    setState(() {
                                      isUploading = false;
                                    });
                                  },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(190, 30, 136, 229),
                                    borderRadius: BorderRadius.circular(7.5)),
                                alignment: Alignment.center,
                                height: 50,
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: _imageUrl == ''
                                    ? const Text(
                                        "Upload Image",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    : const Text(
                                        "View Predictions",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      isUploading
          ? Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: const Color.fromARGB(121, 53, 51, 51),
                child: Center(
                  child: LoadingAnimationWidget.flickr(
                      // color: Colors.black,
                      leftDotColor: Colors.blue.shade300,
                      size: 50,
                      rightDotColor: Color.fromARGB(255, 22, 22, 22)),
                ),
              ),
            )
          : const Positioned(child: SizedBox())
    ]);
  }
}
