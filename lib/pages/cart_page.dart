import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  // add to cart button pressed
  void removeItemFromCart(
    BuildContext context,
    Product product,
  ) {
    // show a dialog box to ask use ask to confirm to remove from cart
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
          'remove this item from your cart?',
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

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        content: Text(
          'User wants to pay! contect this app to uuour payment backend!',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
// get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Cart Page',
        ),
      ),
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: <Widget>[
          // cart list
          Expanded(
            child: cart.isEmpty
                ? const Text(
                    'YOur CArt is Emty',
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual item in cart
                      final item = cart[index];

                      // return ad a cart tile UI
                      return ListTile(
                        title: Text(
                          item.name,
                        ),
                        subtitle: Text(
                          item.price.toStringAsFixed(
                            2,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.remove,
                          ),
                          onPressed: () => removeItemFromCart(
                            context,
                            item,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // pay button
          Padding(
            padding: const EdgeInsets.all(
              0.0,
            ),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text(
                'PAY NOW',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
