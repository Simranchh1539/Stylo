import 'package:get/state_manager.dart';
import 'package:tiktokflutter/model/product.dart';
import 'package:tiktokflutter/services/remote_service.dart';

class ProductController extends GetxController {
  // ignore: deprecated_member_use
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  //for fetching data
  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }
}
