import 'package:flutter/material.dart';
import 'package:foodshopapp/utils/themes.dart';

import '../../widgets/shop_item_card.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text("This is the shop name",style: titleStyle,),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on,color: Colors.grey,),
                Text("Dhaka,Bangladesh",style: subCardTitleStyle,),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Feature",style: titleStyle,),
            ),
            Expanded(
              child: GridView.builder(

                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,

                ),
                itemCount: 20,
                itemBuilder: (context,index){
                  return SizedBox(
                    height: 200,
                      width: 120,
                      child: ShopItemCard());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
