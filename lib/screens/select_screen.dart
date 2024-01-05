import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:terrain_recognition/services/camera_image.dart';
import '../services/gallery_image.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String _image = '';

  void selectImage() async {
    var res = await pickImage();
    setState(() {
      _image = res;
    });
  }

  void captureImage() async {
    var res = await takeImage();
    setState(() {
      _image = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Terrain Recognitin'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            child: _image == ''
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
                          File(_image),
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
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            const Color.fromARGB(190, 30, 136, 229))),
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
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            const Color.fromARGB(190, 30, 136, 229))),
                    onPressed: () {
                      selectImage();
                    },
                    child: const Text(
                      'Gallery',
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
