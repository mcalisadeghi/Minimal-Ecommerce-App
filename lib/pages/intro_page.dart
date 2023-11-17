import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              size: 72.0,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: 25.0,
            ),
            // title
            Text(
              'Minimal Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // subtitle
            Text(
              'Premium Quality Products',
            ),

            // button
          ],
        ),
      ),
    );
  }
}
