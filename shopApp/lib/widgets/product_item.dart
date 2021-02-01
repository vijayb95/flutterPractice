import 'package:flutter/material.dart';
import 'package:shopApp/screens/product_detail_screen.dart';
// import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductItem(
      {this.id, this.title, this.description, this.price, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('');
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: GridTileBar(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black45,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            '\$$price.toString()',
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {},
              color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
