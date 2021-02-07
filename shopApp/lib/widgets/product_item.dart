import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';
// import 'package:shopApp/screens/products_overview_screen.dart';
// import '../models/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String description;
  // final double price;
  // final String imageUrl;

  // ProductItem(
  //     {this.id, this.title, this.description, this.price, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: GridTileBar(
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black45,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            '\$${product.price}',
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                cart.addItem(product.id, product.title, product.price);
              },
              color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
