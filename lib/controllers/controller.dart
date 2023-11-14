import 'package:get/get.dart';
import '../models/product_model.dart';
import '../utils/services.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading(true); // 데이터를 불러오는 동안 isLoading을 true로 설정
    var products = await Services.fetchProducts();
    if (products != null) productList.value = products;
    isLoading(false); // 데이터를 성공적으로 불러온 후에는 isLoading을 false로 설정
  }
}
