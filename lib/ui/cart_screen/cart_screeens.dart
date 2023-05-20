import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/consts/consts.dart';

import '../../utils/themes.dart';
import '../../widgets/item_card.dart';

class CartScreeen extends StatefulWidget {
  const CartScreeen({Key? key}) : super(key: key);

  @override
  State<CartScreeen> createState() => _CartScreeenState();
}

class _CartScreeenState extends State<CartScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: firestore.collection("uers_carts_items").doc(currentUser!.email).collection("items").snapshots(),
          builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text("Something went wrong"),
              );
            }else if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: Text("Loading"));
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                return Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    padding: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(.1)
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network("${documentSnapshot["image"]}",height: 100,width: 120,fit: BoxFit.cover,),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
                              Text("${documentSnapshot["name"]}",style: cardTitleStyle,maxLines: 2,overflow: TextOverflow.ellipsis,),
                              const SizedBox(height: 10),
                              Text("\$${documentSnapshot["price"]}",style: cardTitleStyle,),
                              const SizedBox(height: 10),
                            ],
                          ),
                        )
                      ],
                    )
                );
              },
            );
          },
        ),
      ),
    );
  }
}
