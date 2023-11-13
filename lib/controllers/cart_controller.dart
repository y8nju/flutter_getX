import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  // cartItems가 초기화 되기 전에는 사용할 수 없으므로, get(getter)를 사용한다
  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);
  int get count => cartItems.length;
  void addToItem(Product product) {
    cartItems.add(product);
  }
}
