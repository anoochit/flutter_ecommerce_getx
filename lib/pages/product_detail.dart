import 'package:ecommerce_getx/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
        actions: [
          // TODO : place cart icon button widget
        ],
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image
                Placeholder(
                  color: Colors.grey.shade300,
                ),

                // title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${product.price}'),
                ),

                // description
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${product.description}'),
                ),

                // add to cart button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO : add product to cart
                      },
                      child: const Text("Add to cart"),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
