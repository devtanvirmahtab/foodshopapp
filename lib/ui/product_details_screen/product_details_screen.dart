import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/consts/consts.dart';
import 'package:foodshopapp/utils/themes.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';

class ProductDetailsPage extends StatefulWidget {
 var data ;

  ProductDetailsPage({
    required this.data
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

   final ProductController controller = Get.put(ProductController());


  Future addToCart(){
    CollectionReference collectionReference = firestore.collection("uers_carts_items");
    return collectionReference.doc(currentUser!.email).collection("items").doc().set(
      {
        "name": widget.data["productTitle"],
        "price" : widget.data["productPrice"],
        "image": widget.data["productImage"],
        "totalItem" : controller.quantity.value,
        "totalPrice" : controller.totalPrice,
      }
    ).then((value) => print("Added to cart"));
  }


  @override
  Widget build(BuildContext context) {
    controller.calculateTotalPrice(widget.data["productPrice"]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Image.network("${widget.data["productImage"]}",width:double.infinity,height: 250,fit: BoxFit.cover,)),
            const SizedBox(height: 16.0),
            Text(
              "${widget.data["productTitle"]}",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "${widget.data["productDescription"]}",
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.data["productPrice"]}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
               Obx(
              () => Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                         controller.decreaseQuantity();
                         controller.calculateTotalPrice(widget.data["productPrice"]);
                        },
                      ),
                      const SizedBox(width: 8.0),
                       Text(
                         " ${controller.quantity.value}",
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      const SizedBox(width: 8.0),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          controller.increaseQuantity();
                          controller.calculateTotalPrice(widget.data["productPrice"]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                addToCart();
              },
              child: Text('Add to Cart'),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: GetBuilder<ProductController>(
                  builder: (_){
                    return Text("Total Price = ${controller.totalPrice.toStringAsFixed(2)}",style: titleStyle,);
                  },

              )
            ),
          ],
        ),
      ),
    );
  }
}
