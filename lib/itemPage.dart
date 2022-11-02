import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stmtproviders/provider/data.dart';
import 'package:stmtproviders/provider/datamodel.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<DataModel>(context);
    return Card(
      child: Column(
        children: [
          Image.network(
            product.image,
            width: 100,
            height: 100,
          ),
          Text(product.title),
          Text(product.price.toString()),
          IconButton(
            icon: Icon(
              product.isincart ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              product.toggleFavoriteStatus();
              setState(
                () {
                  product.addtocart(product);
                  // product1.findById();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
