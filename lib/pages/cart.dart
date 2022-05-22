import 'package:ecommerce_getx/const.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: (listCart.isNotEmpty)
          ? SingleChildScrollView(
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    Column(
                      children: listCart.map((e) {
                        return ListTile(
                          title: Text(listProduct.where((element) => element.id == e.productId).first.title),
                          subtitle: Text('X ${e.quantity}'),
                          trailing: ElevatedButton(
                            child: const Text("Remove"),
                            onPressed: () {
                              // TODO : remove item at index from cart
                              setState(() {
                                listCart.removeAt(listCart.indexOf(e));
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),

                    // total price
                    const Divider(
                      thickness: 2.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // total item
                          Text(
                            'Items: ${listCart.map((e) => e.quantity).reduce((a, b) => a + b)}',
                            style: const TextStyle(fontSize: 18.0),
                          ),

                          // total price
                          Text(
                            'Price: \$${listCart.map((e) => e.quantity * listProduct.where((element) => element.id == e.productId).first.price).reduce((a, b) => a + b)}',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),

                    // proceed to checkout button
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: constraints.maxWidth,
                      child: ElevatedButton(
                          onPressed: () {
                            // proceess to checkout
                          },
                          child: const Text("Checkout")),
                    )
                  ],
                );
              }),
            )
          : const Center(
              child: Text("No item in cart"),
            ),
    );
  }
}
