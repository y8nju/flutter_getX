import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/controller.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard({Key? key}) : super(key: key);
  final Controller controller = Get.put(Controller());

  // GexX
  // - Obx:
  //    Observable(obs)의 변화를 listen
  //    Controller인스턴스가 미리 다른 곳에 initialize 되어 있어야 함
  // - GetX:
  //    Observable(obs)의 변화를 listen
  //    자체적으로 Controller 인스턴스를 initialize 할 수도 있음
  //    Obx보다 다양한 기능을 내장하고 있어서 좀 더 무거움
  // - GetBuilder:
  //    Observable(obs)의 변화를 listen 하지 않음
  //    수동으로 UI를 리빌드 해야하기에 반드시 update메서드를 호출해야 함
  //    자체적으로 Controller 인스턴스를 initialize 할 수 있음

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF89dad0),
              ),
              child: Center(
                // GetX
                child: GetX<Controller>(
                  builder: (_) => Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        textBaseline: TextBaseline.ideographic,
                      ),
                      children: [
                        TextSpan(text: 'Name: '),
                        if (controller.person().name.isNotEmpty)
                          TextSpan(text: '${controller.person().name}')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF89dad0),
              ),
              child: Center(
                // Obx
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        textBaseline: TextBaseline.ideographic,
                      ),
                      children: [
                        TextSpan(text: 'Age: '),
                        if (controller.person().age != 0)
                          TextSpan(text: '${controller.person().age}')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF89dad0),
              ),
              child: Center(
                  child: GetX(
                init: Controller(),
                builder: (controller) => Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      textBaseline: TextBaseline.ideographic,
                    ),
                    children: [
                      TextSpan(text: 'Age: '),
                      if (Get.find<Controller>().person().age > 0)
                        TextSpan(
                          text: Get.find<Controller>().person().age.toString(),
                        ),
                    ],
                  ),
                ),
              )),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF89dad0),
              ),
              child: Center(
                  child: GetX(
                init: Controller(),
                builder: (controller) => Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      textBaseline: TextBaseline.ideographic,
                    ),
                    children: [
                      TextSpan(text: 'Job: '),
                      if (Get.find<Controller>().person().job != null)
                        TextSpan(text: Get.find<Controller>().person().job),
                    ],
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateInfo();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
