import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/terrain_data.dart';

class PredictionScreen extends StatelessWidget {
  final String imagePath;
  final String terrainType;

  const PredictionScreen({
    super.key,
    required this.imagePath,
    required this.terrainType,
  });

  @override
  Widget build(BuildContext context) {
    String type = terrainType[0].toUpperCase() + terrainType.substring(1);
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Terrain Prediction'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            bottom: 400,
            child: SizedBox(
              width: 300,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              width: 325,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 325,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        gradient: colorData[type],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Terrain Type",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text(
                          type,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 325,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        // color: col,
                        gradient: colorData[type],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Slipperiness",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text(terrainData[type]!["Slipperiness"]!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 325,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        gradient: colorData[type],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Treacherousness",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text(terrainData[type]!["Slipperiness"]!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 325,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        gradient: colorData[type],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Surface Stability",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text(terrainData[type]!["Slipperiness"]!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 325,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        gradient: colorData[type],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Vegetation",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text(terrainData[type]!["Slipperiness"]!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 325,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        gradient: colorData[type],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Hydration",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text(terrainData[type]!["Slipperiness"]!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
