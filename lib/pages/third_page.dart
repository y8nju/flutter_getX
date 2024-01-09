import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/controllers/tap_controller.dart';
import 'package:getx_begginer/pages/my_home_page.dart';

class ThirdPage extends StatelessWidget {
  final TapController controller = Get.find();
  ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<TapController>(
              builder: (_) {
                return Container(
                  width: double.maxFinite,
                  height: 100,
                  margin: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      controller.x.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () => Get.to(MyHomePage()),
              child: Container(
                width: double.maxFinite,
                height: 100,
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
