import 'package:get/get.dart';
import 'package:getx_begginer/model.dart';

class Controller extends GetxController {
  final person = Person().obs; // obs(observable): Rs 데이터 스트림 관찰
  void updateInfo() {
    person.update((val) {
      val?.age++; // null값이 들어올 수 있으므로 ?
      val?.name = 'Aru';
    });
    update();
  }
}
