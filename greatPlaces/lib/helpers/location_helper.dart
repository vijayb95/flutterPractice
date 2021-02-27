import 'dart:convert';

import 'package:http/http.dart' as http;

const MAPBOX_API_KEY =
    'pk.eyJ1IjoiZGhhc2RoYSIsImEiOiJja2xpNWxwYXAwZDAyMnBxaWMyYWc4bjR1In0.1Xuj-pIZpY8v541XfINOgA';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/$longitude,$latitude,10.04,0/300x200?access_token=$MAPBOX_API_KEY";
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        "https://api.mapbox.com/geocoding/v5/mapbox.places/$lng,$lat.json?access_token=$MAPBOX_API_KEY";
    final response = await http.get(url);
    return json.decode(response.body)['features'][0]['properties']['address'];
  }
}
