import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/consts/consts.dart';
import 'package:foodshopapp/controllers/auth_controller.dart';
import 'package:foodshopapp/ui/auth_screen/login_screen.dart';
import 'package:foodshopapp/utils/themes.dart';
import 'package:get/get.dart';

import '../cart_screen/cart_screeens.dart';
import '../categories/category_Item_screen.dart';
import '../product_details_screen/product_details_screen.dart';
import '../shop_screen/shop_screen.dart';
import '../../consts/firebase_consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List productList = [];

  productsFetch()async{
   QuerySnapshot qn = await firestore.collection("products").get();
   setState(() {
     for(int i = 0; i<qn.docs.length; i++){
       productList.add(
         {
           "productTitle" : qn.docs[i]["productTitle"],
           "productDescription" : qn.docs[i]["productDescription"],
           "productImage" : qn.docs[i]["productImage"],
           "productPrice" : qn.docs[i]["productPrice"],
         }
       );
     }
   });

   return qn.docs;
  }

  @override
  void initState() {
    productsFetch();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded,size: 32,color: Colors.black,),
            onPressed: (){
              Get.to(CartScreeen());
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: Drawer(
          child: Column(
            children: [
              TextButton(onPressed: ()async{
                await Get.put(AuthController().signOutMethod(context));
                Get.offAll(() => LogInScreen());
                }, child: const Text("Log Out"))
            ],
          ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                hintText: "Search Items",
                focusedBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15)
                ),
                enabledBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),
            const SizedBox(height: 20),
            Text("Feature",style: titleStyle,),
            const SizedBox(height: 10),
            SizedBox(
             height: 145,
              child: StreamBuilder(
                stream: firestore.collection("products").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasError){
                    return Text("somethisng went wrong");
                  }else if(snapshot.connectionState == ConnectionState.waiting){
                    return Text("Loading");
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Get.to(ProductDetailsPage(
                              imageUrl: "${snapshot.data!.docs[index]["productImage"]}",
                              title: "${snapshot.data!.docs[index]["productTitle"]}",
                              description: "${snapshot.data!.docs[index]["productDescription"]}",
                              price: snapshot.data!.docs[index]["productPrice"],
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                      child: Image.network("${snapshot.data!.docs[index]["productImage"]}",fit: BoxFit.cover,)),
                                ),
                                Text("${snapshot.data!.docs[index]["productTitle"]}",style: textStyle,)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              )
              ,
            ),
            const SizedBox(height: 10),
            Text("Shop",style: titleStyle,),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: productList.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Get.to(ShopScreen());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20,bottom: 5,),
                          width: double.infinity,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                              child: Image.asset(productList[index]["productImage"])
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${productList[index]["productTitle"]}",style: cardTitleStyle,),
                            Row(
                              children: [
                               const Icon(Icons.location_on,color: Colors.grey,),
                                Text("Dhaka,Bangladesh",style: subCardTitleStyle,),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
