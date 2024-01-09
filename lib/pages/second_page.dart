import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/controllers/tap_controller.dart';
import 'package:getx_begginer/pages/third_page.dart';

class SecondPage extends StatelessWidget {
  final TapController controller = Get.find();
  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Second Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Get.back(),
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.amber[200],
        child: Center(
          child: GestureDetector(
            onTap: () {
              Get.to(() => ThirdPage());
            },
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
                  'Go to Third Page',
                  style: TextStyle(
                    color: Colors.amber[200],
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
