import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_begginer/helper/init_controllers.dart' as helper;
import 'package:getx_begginer/helper/init_dependency.dart';
import 'package:getx_begginer/pages/my_home_page.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await helper.init();
  // InitDep().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: InitDep(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      // home: MyHomePage(),
      // initialBinding로 의존성을 추가할 때, home이 아닌 getPages로 라우트를 설정한다
      getPages: [
        GetPage(
          name: '/',
          page: () => MyHomePage(),
        ),
      ],
    );
  }
}
