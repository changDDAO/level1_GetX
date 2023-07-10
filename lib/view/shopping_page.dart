import 'package:flutter/material.dart';
import 'package:level1/controller/cart.dart';
import 'package:level1/controller/shopping_controller.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
   ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (shoppingController) {
                return ListView.builder(
                  itemCount: shoppingController.products.length,
                    itemBuilder:(context, index){
                    return Card(
                      margin: EdgeInsets.all(12),
                      child: Padding(
                      padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${shoppingController.products[index].productName}', style: TextStyle(
                                      fontSize: 24,

                                    ),),
                                    Text('${shoppingController.products[index].productDescription}'),
                                  ],
                                ),
                                Text('${shoppingController.products[index].price}', style: TextStyle(
                                  fontSize: 24,

                                ),),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: (){
                                  cartController.addToItem(shoppingController.products[index]);
                                },
                                child: Text('Add to cart'),)
                          ],
                        ),
                      ),
                    );
                    }
                );
              }
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GetX<CartController>(
              builder: (cartController) {
              return Text('Total amount : \$ ${cartController.totalPrice}', style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),);
            }
          ),
          SizedBox(
            height: 100,
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: GetX<CartController>(
            builder: (cartController) {
              return Text('item_cnt: ${cartController.count}',
              style: TextStyle(
                fontSize: 20,

              ),);
            }
          ),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
