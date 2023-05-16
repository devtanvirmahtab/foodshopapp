import 'package:flutter/material.dart';
import 'package:foodshopapp/controllers/auth_controller.dart';
import 'package:foodshopapp/ui/auth_screen/login_screen.dart';
import 'package:foodshopapp/utils/themes.dart';
import 'package:get/get.dart';

import '../categories/category_Item_screen.dart';
import '../shop_screen/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Text("Categories",style: titleStyle,),
            const SizedBox(height: 10),
            SizedBox(
             height: 90,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Get.to(CategoryItemScreen());
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 50,
                            height: 50,
                            child: Image.asset("assets/images/pizza.png",fit: BoxFit.cover,),
                          ),
                          Text("Pizza",style: textStyle,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text("Shop",style: titleStyle,),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
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
                              child: Image.asset("assets/images/fast1.jpg",fit: BoxFit.cover,)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Fast Restaurant",style: cardTitleStyle,),
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
