import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Controller controller = Get.put(Controller());
    // GetBuilder<Controller> ( init : Controller(),), 와 동일

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX exmaple'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1. 코딩셰프',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'branch: codingchef',
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'branch: shop_lecture',
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'branch: getX_practice',
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'branch: ReactiveStatemanager',
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                '2. dbestech',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'branch: dbestech',
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
