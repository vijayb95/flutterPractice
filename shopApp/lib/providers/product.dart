import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  Future<void> toggleFavoriteStatus(String id, Product newProduct) async {
    final url =
        'https://shop-app-6196d-default-rtdb.firebaseio.com/products/$id.json';
    isFavorite = !isFavorite;
    try {
      final response = await http.patch(url,
          body: json.encode({
            'isFavorite': isFavorite,
          }));
      if (response.statusCode >= 400) isFavorite = !isFavorite;
    } catch (e) {
      isFavorite = !isFavorite;
    }
    notifyListeners();
  }
}
