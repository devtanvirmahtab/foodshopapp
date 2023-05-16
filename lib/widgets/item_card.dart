import 'package:flutter/material.dart';
import 'package:foodshopapp/utils/themes.dart';

class ItemCardPreview extends StatelessWidget {
  const ItemCardPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset("assets/images/fast1.jpg",height: 100,width: 120,fit: BoxFit.cover,),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text("Product Title is here Product Title is here Product Title is here Product Title is hereProduct Title is here",style: cardTitleStyle,maxLines: 2,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 10),
                Text("\$90.00",style: cardTitleStyle,),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      )
    );
  }
}
