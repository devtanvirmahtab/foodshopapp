import 'package:flutter/material.dart';

import '../utils/themes.dart';

class ShopItemCard extends StatelessWidget {
  const ShopItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.withOpacity(.1)
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/images/fast1.jpg",height: 120,fit: BoxFit.cover,),
            ),
           Container(
             margin: EdgeInsets.only(left: 10,top: 10),
             child: Column(
               children: [
                 Text("Product Title is here Product Title is here Product Title is here Product Title is hereProduct Title is here",style: cardTitleStyle,maxLines: 2,overflow: TextOverflow.ellipsis,),
                 const SizedBox(height: 10),
                 SizedBox(
                   height: 52,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("\$90.00",style: cardTitleStyle,),
                       Align(
                         alignment: Alignment.bottomLeft,
                         child: Container(
                           height: 40,
                           width: 40,
                           decoration: const BoxDecoration(
                             color: Colors.amber,
                             borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight:Radius.circular(15) )
                           ),
                           child: const Icon(Icons.add),
                         ),
                       )
                     ],
                   ),
                 ),
               ],
             ),
           )
          ],
        )
    );
  }
}
