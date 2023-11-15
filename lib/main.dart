import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/controllers/auth_controller.dart';
import 'package:getx_begginer/screens/login_page.dart';
import 'package:getx_begginer/screens/mypage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetFlutterBinding는 Flutter Engine과의 상호작용을 위해 사용된다.
  // ensureInitialized()를 호출하여 플랫폼 채널의 위젯 바인딩을 보장해야한다.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  ).then((value) => Get.lazyPut(() => AuthController()));
  // Firebase를 초기화
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Controller controller = Get.put(Controller());
    // GetBuilder<Controller> ( init : Controller(),), 와 동일

    return GetMaterialApp(
      title: 'Shopping Mall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
