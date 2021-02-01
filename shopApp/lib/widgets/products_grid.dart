import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    
    return Container(
      color: Colors.grey[300],
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          // create: (ctx) => products[i], //Use when 'changeNotifierProvider' is used which is similar to using 'ChangeNotifierProvider.value', the only difference is we can avoid receiving context unnecessarily.
          value: products[i],
          child: ProductItem(
            // id: products[i].id,
            // title: products[i].title,
            // imageUrl: products[i].imageUrl,
            // price: products[i].price,
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.75 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
