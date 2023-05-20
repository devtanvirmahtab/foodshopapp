import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/consts/consts.dart';

class ProductDetailsPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  ProductDetailsPage({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int itemCount = 1;

  void incrementItemCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItemCount() {
    setState(() {
      if (itemCount > 1) {
        itemCount--;
      }
    });
  }

  Future addToCart(){
    CollectionReference collectionReference = firestore.collection("uers_carts_items");
    return collectionReference.doc(currentUser!.email).collection("items").doc().set(
      {
        "name": widget.title,
        "price" : widget.price,
        "image": widget.imageUrl
      }
    ).then((value) => print("Added to cart"));
  }

  @override
  Widget build(BuildContext context) {
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
                child: Image.network(widget.imageUrl,width:double.infinity,height: 250,fit: BoxFit.cover,)),
            const SizedBox(height: 16.0),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.price}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        decrementItemCount();
                      },
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '$itemCount',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(width: 8.0),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        incrementItemCount();
                      },
                    ),
                  ],
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
          ],
        ),
      ),
    );
  }
}
