import 'package:flutter/material.dart';
import 'package:getx_begginer/controller.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

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
            title: Text('GetX'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<Controller>(
                  init: Controller(),
                  builder: (_) => Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          text: 'Current value is: ',
                        ),
                        TextSpan(
                          text: '${Get.find<Controller>().x}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.find<Controller>().increment();
                  },
                  child: Text('Add number'),
                ),
              ],
            ),
          )),
    );
  }
}
