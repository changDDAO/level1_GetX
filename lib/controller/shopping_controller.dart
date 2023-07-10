import 'package:get/get.dart';

import '../model/product.dart';

class ShoppingController extends GetxController{
 var products = <Product>[].obs;

 @override
  void onInit() {
  super.onInit();
  fetchData();
  }
  void fetchData() async{
   await Future.delayed(Duration(seconds: 1));
   var productData = [
     Product(
         id: 1,
         price: 30,
         productDescription: 'some description about Product',
         productName: 'Mouse'
     ),
     Product(
         id: 2,
         price: 40,
         productDescription: 'some description about Product',
         productName: 'KeyBoard'
     ),
     Product(
         id: 3,
         price: 620,
         productDescription: 'some description about Product',
         productName: 'Monitor'
     ),
     Product(
         id: 4,
         price: 80,
         productDescription: 'some description about Product',
         productName: 'Ram'
     ),
     Product(
         id: 5,
         price: 120,
         productDescription: 'some description about Product',
         productName: 'Speaker'
     ),
   ];
  products.assignAll(productData);
  }
}