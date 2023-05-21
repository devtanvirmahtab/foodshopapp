import 'package:get/get.dart';

class CartController extends GetxController{
  double total = 0;

  calculate(data){
    for(int i =0 ; i<= data.lenth ;i++){
      total = total + data[i];
    }
    update();
  }
}