import 'package:flutter/material.dart';

Map<String, Map<String, dynamic>> terrainData = {
  "Grassy": {
    "Slipperiness": "Mid",
    "Treacherousness": "Low",
    "Surface Stability": "Mid",
    "Vegetation": "High",
    "Hydration": "Mid",
  },
  "Snowy": {
    "Slipperiness": "High",
    "Treacherousness": "Mid",
    "Surface Stability": "Low",
    "Vegetation": "Low",
    "Hydration": "Low",
  },
  "Marshy": {
    "Slipperiness": "High",
    "Treacherousness": "High",
    "Surface Stability": "Low",
    "Vegetation": "Mid",
    "Hydration": "High",
  },
  "Rocky": {
    "Slipperiness": "Low",
    "Treacherousness": "Mid",
    "Surface Stability": "Mid",
    "Vegetation": "Low",
    "Hydration": "Low",
  },
  "Sandy": {
    "Slipperiness": "Mid",
    "Treacherousness": "Mid",
    "Surface Stability": "Low",
    "Vegetation": "Low",
    "Hydration": "Low",
  },
};

Map<String, Gradient> colorData = {
  "Sandy": sandy,
  "Snowy": snowy,
  "Grassy": grassy,
  "Rocky": rocky,
  "Marshy": marshy,
};

const LinearGradient sandy = LinearGradient(colors: [
  Color.fromARGB(255, 174, 139, 48),
  Color.fromARGB(255, 180, 118, 25),
], stops: [
  0.4,
  0.8
]);
const LinearGradient grassy = LinearGradient(colors: [
  Color.fromARGB(255, 81, 162, 82),
  Color.fromARGB(255, 126, 180, 25),
], stops: [
  0.5,
  1
]);
const LinearGradient snowy = LinearGradient(colors: [
  Color.fromARGB(255, 144, 204, 232),
  Color.fromARGB(255, 207, 223, 228),
], stops: [
  0.5,
  1
]);
const LinearGradient rocky = LinearGradient(colors: [
  Color.fromARGB(255, 169, 158, 126),
  Color.fromARGB(255, 120, 118, 114),
], stops: [
  0.5,
  1
]);
const LinearGradient marshy = LinearGradient(colors: [
  Color.fromARGB(255, 143, 164, 58),
  Color.fromARGB(255, 145, 144, 84),
], stops: [
  0.5,
  1
]);
