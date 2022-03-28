import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tiktokflutter/controller/cartcontroller.dart';

import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:tiktokflutter/views/carttile.dart';
import 'package:tiktokflutter/views/home.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController _cartController = Get.put(CartController());
  CartController controller = Get.find();
  int crossaxis = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Cart Items"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Stylo",
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => StaggeredGridView.countBuilder(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTile(controller.cartItems[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
