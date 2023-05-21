import 'package:get/get.dart';

class ProductController extends GetxController{
  var quantity = 1.obs;
  double totalPrice = 0.0;

  increaseQuantity(){
    quantity.value++;
  }
  decreaseQuantity(){
    if(quantity.value>1){
      quantity.value--;
    }
  }
  calculateTotalPrice(price){

    totalPrice = price;
    totalPrice = price * quantity.value;
    update();
  }
}