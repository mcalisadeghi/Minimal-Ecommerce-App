import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({
    super.key,
    required this.product,
  });
  // add to cart button pressed
  void addToCart(BuildContext context) {
    // show a dialog box to ask use =r to confirm to add to cart
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
          'add this item to our cart?',
        ),
        actions: <Widget>[
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
            ),
          ),
// yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);
              // add to cart
              context.read()<Shop>().addToCart(product);
            },
            child: const Text(
              'Yes',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: const EdgeInsets.all(
        25.0,
      ),
      width: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                  child: Image.asset(
                    product.imagePath,
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              // product name
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          // product price + add to cart buttonn
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // product price
              Text(
                '/s${product.price.toStringAsFixed(
                  2,
                )}',
              ),
              // ad to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
