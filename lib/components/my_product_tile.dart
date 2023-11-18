import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      margin: EdgeInsets.all(
        10.0,
      ),
      padding: EdgeInsets.all(
        25.0,
      ),
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // product image
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
              ),
              child: Icon(
                Icons.favorite,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          // product name
          Text(
            product.name,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // product description
          Text(
            product.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          // product price + add to cart buttonn
          Text(
            product.price.toStringAsFixed(
              2,
            ),
          ),
        ],
      ),
    );
  }
}
