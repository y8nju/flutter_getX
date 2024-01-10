import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/controllers/tap_controller.dart';
import 'package:getx_begginer/pages/first_page.dart';
import 'package:getx_begginer/pages/second_page.dart';

class MyHomePage extends StatelessWidget {
  TapController controller = Get.find();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<TapController>(
                // init: TapController(),
                builder: (_) {
              return Container(
                width: double.maxFinite,
                height: 80,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[200],
                ),
                child: Center(
                  child: Text(
                    'X: ${controller.x.toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }),
            GestureDetector(
              onTap: () => controller.increaseX(),
              child: Container(
                width: double.maxFinite,
                height: 80,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[200],
                ),
                child: const Center(
                  child: Text(
                    'Increse X',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => FirstPage());
              },
              // Get.to(page): page로 이동
              child: Container(
                width: double.maxFinite,
                height: 80,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[100],
                ),
                child: const Center(
                  child: Text(
                    'Go to First Page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const SecondPage());
              },
              child: Container(
                width: double.maxFinite,
                height: 80,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber[200],
                ),
                child: const Center(
                  child: Text(
                    'Go to Second Page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.maxFinite,
                height: 80,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[200],
                ),
                child: const Center(
                  child: Text(
                    'Tap',
                    style: TextStyle(
                      color: Colors.white,
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
