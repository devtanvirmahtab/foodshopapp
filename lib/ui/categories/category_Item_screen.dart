import 'package:flutter/material.dart';

import '../../widgets/item_card.dart';

class CategoryItemScreen extends StatelessWidget {
  const CategoryItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context,index){
          return ItemCardPreview();
        },
      ),
    );
  }
}
