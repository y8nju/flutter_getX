import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Obx(() {
            if (authController.isLoading.value) {
              return CircularProgressIndicator();
            } else {
              return Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.bebasNeue(fontSize: 36.0),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${authController.user.value!.email}',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Name: ${authController.userProfile.value != null ? authController.userProfile.value['name'] : 'Loading...'}',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    ),
                    // 다른 필드도 동일한 방식으로 추가할 수 있습니다.
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        authController.logout();
                      },
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.login_outlined,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
