import 'package:get/state_manager.dart';
import 'package:tiktokflutter/model/product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>().obs;

  void addItemInCart(Product product) {
    final index = cartItems.indexWhere((element) => element.id == product.id);

    if (index >= 0) {
      //here product already in list, so will upadte qunatity only
      cartItems[index] = product;
    } else {
      cartItems.add(product);
    }
  }
}
