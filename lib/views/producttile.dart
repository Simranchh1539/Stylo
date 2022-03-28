import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokflutter/controller/cartcontroller.dart';
import 'package:tiktokflutter/model/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);
  final CartController _cartController = Get.put(CartController());
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 200,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.imageLink,
                      fit: BoxFit.cover,
                      height: 180,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(() => CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: product.isFavorite.value
                                ? Icon(Icons.favorite_rounded)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              product.isFavorite.toggle();
                            },
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              if (product.rating != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.rating.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(fontSize: 32, fontFamily: 'avenir'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      cartController.addItemInCart(product);
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent[100],
                        radius: 12,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
