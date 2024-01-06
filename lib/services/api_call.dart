import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getPrediction(String imageUrl) async {
  try {
    String apiEndpint = "https://parikshan.onrender.com/predict_terrain";
    String urlWithQuery = "$apiEndpint?image_url=$imageUrl";

    var response = await http.get(Uri.parse(urlWithQuery));
    String terrainType = (jsonDecode(response.body))['predicted_terrain'];
    return terrainType;
  } catch (e) {
    return e.toString();
  }
}
