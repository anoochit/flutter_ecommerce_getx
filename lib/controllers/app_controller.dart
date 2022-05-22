import 'package:get/get.dart';
import '../models/cart.dart';

class AppController extends GetxController {
  // Rx variable
  RxList<Cart> listCart = RxList<Cart>();

  // some methords
  addItemToCart(Cart cart) {
    // check item is already in cart
    if (listCart.where((e) => e.productId == cart.productId).isEmpty) {
      // has not in cart, add it
      listCart.add(cart);
    } else {
      // has in cart, update quantity
      listCart.firstWhere((e) => e.productId == cart.productId).quantity++;
    }
    update();
  }
}
