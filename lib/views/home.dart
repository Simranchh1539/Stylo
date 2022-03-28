import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tiktokflutter/controller/productcontroller.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:tiktokflutter/views/card_home.dart';
import 'package:tiktokflutter/views/producttile.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController _productController = Get.put(ProductController());

  int crossaxis = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Get.to(
                () => CartPage(),
              );
            },
          )
        ],
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
                IconButton(
                    icon: Icon(Icons.view_list_rounded),
                    onPressed: () {
                      setState(() {
                        crossaxis = 1;
                      });
                    }),
                IconButton(
                    icon: Icon(Icons.grid_view),
                    onPressed: () {
                      setState(() {
                        crossaxis = 2;
                      });
                    }),
              ],
            ),
          ),
          //body that show products
          Expanded(
            child: Obx(
              () => StaggeredGridView.countBuilder(
                crossAxisCount: crossaxis,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemCount: _productController.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(_productController.productList[index]);
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
