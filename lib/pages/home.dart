import 'package:ecommerce_getx/const.dart';
import 'package:ecommerce_getx/controllers/app_controller.dart';
import 'package:ecommerce_getx/pages/cart.dart';
import 'package:ecommerce_getx/pages/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/shoppingcart_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce"),
        actions: [
          // shopping cart icon button widget
          ShoppingCartButton(appController: appController)
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
                //   navigate to product detail page
                Get.to(
                  () => ProductDetailPage(
                    product: listProduct[index],
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
