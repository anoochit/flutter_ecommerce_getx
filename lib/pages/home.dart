import 'package:ecommerce_getx/const.dart';
import 'package:ecommerce_getx/pages/cart.dart';
import 'package:ecommerce_getx/pages/product_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce"),
        actions: [
          // TODO: replace with cart icon button widget
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // TODO : navigate to cart page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
              ),
              Positioned(
                right: 1,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  // TODO : update item count in cart
                  child: Text(
                    '${listCart.length}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: listProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return LayoutBuilder(builder: (context, constraints) {
            return InkWell(
              onTap: () {
                // TODO : navigate to product detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: listProduct[index]),
                  ),
                );
              },
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // image
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.75,
                      child: Placeholder(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    // product name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        listProduct[index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    // product price
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('\$${listProduct[index].price}'),
                    ),
                    // space
                    const SizedBox(height: 8.0)
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
