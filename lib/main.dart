import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/views/mypage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Controller controller = Get.put(Controller());
    // GetBuilder<Controller> ( init : Controller(),), 와 동일

    return MaterialApp(
      title: 'Shopping Mall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}
