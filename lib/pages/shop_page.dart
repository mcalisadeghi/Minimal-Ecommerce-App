import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_drawer.dart';
import 'package:flutter_application_1/components/my_product_tile.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Shop Page',
        ),
        actions: [
          // go to cart button
          IconButton(
            onPressed: () => Navigator.popAndPushNamed(
              context,
              '/cart_page',
            ),
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 25.0,
          ),
          // shop subtitle
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pic from a selected list of premium products',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // product list
          SizedBox(
            height: 550.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              padding: const EdgeInsets.all(
                15.0,
              ),
              itemBuilder: (context, index) {
                // get each indivual product form shop
                final product = products[index];
                // retrn as a product tile UI
                return MyProductTile(
                  product: product,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
