import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/controllers/cart_controller.dart';
import 'package:getx_begginer/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        // Column 위젯 내에서 ListView 위젯을 사용하려면, Expanded로 감싸줘야 정상적으로 출력이 된다!
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
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
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    '${controller.products[index].productDescription}',
                                  ),
                                ],
                              ),
                              Text.rich(
                                TextSpan(
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\$',
                                    ),
                                    TextSpan(
                                      text:
                                          '${controller.products[index].price}',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addToItem(controller.products[index]);
                            },
                            child: Text('Add to Cart'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 80),
            child: GetX<CartController>(
              builder: (controller) {
                return Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: 'Total amount: '),
                      TextSpan(text: '\$ ${controller.totalPrice}'),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          );
        }),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
    );
  }
}
