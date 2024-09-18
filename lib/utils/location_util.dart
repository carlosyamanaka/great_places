import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: constant_identifier_names

const GOOGLE_API_KEY = 'AIzaSyC4uAjD7r_AXsms-_XP6LcA5VGSlgEJxYM';

class LocationUtil {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getAdressFrom(LatLng position) async {
    final Uri url = Uri.https(
      'maps.googleapis.com', // Host
      '/maps/api/geocode/json', // Caminho
      {
        'latlng': '${position.latitude},${position.longitude}', // Parâmetros
        'key': GOOGLE_API_KEY,
      },
    );
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
