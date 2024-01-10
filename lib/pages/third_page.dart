import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/controllers/list_controller.dart';
import 'package:getx_begginer/controllers/tap_controller.dart';
import 'package:getx_begginer/pages/my_home_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    ListController listController = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // forceMaterialTransparency: true,
        title: const Text('Third Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Get.back(),
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.orange[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 40,
                      margin: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'X: ${Get.find<TapController>().x}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 40,
                      margin: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Y: ${Get.find<TapController>().y.value}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 40,
                      margin: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'X + Y: ${Get.find<TapController>().z.toString()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.find<TapController>().increaseY();
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 80,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Increase Y',
                            style: TextStyle(
                              color: Colors.orange[200],
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.find<TapController>().totalXY();
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 80,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Get Total X + Y',
                            style: TextStyle(
                              color: Colors.orange[200],
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        int num = Get.find<TapController>().z;
                        Get.find<ListController>().setValues(num);
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 80,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Save Total',
                            style: TextStyle(
                              color: Colors.orange[200],
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => MyHomePage());
              },
              child: Container(
                width: double.maxFinite,
                height: 80,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Go to My Home',
                    style: TextStyle(
                      color: Colors.orange[200],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
