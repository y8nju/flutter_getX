import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getx_begginer/screens/login_page.dart';
import 'package:getx_begginer/screens/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  // 다른 페이지에서 사용되는 컨트롤러를 Get으로 찾아서 redirect 할 수 있습니다.
  // 마법처럼 Get이 controller를 찾아서 가져올 것 입니다.
  // 백만개의 인스턴스화 contrller를 가질수 있고 Get은 올바른 controller를 항상 가져다 줄 것입니다.
  late Rx<User?> _user;
  // User: FirebaseAuthentication, firebase 인스턴스
  // 사용자의 정보를 가지고 있다
  FirebaseAuth authentication = FirebaseAuth.instance;
  Rx<User?> get user => _user;
  // Firestore 인스턴스
  FirebaseFirestore db = FirebaseFirestore.instance;

  var isLoading = false.obs;
  var userProfile = {}.obs;

  @override
  void onReady() {
    // onReady(): GetxController 가 initialized 된 후 호출
    // 기본적인 랜더링이 끝나고 네트워크에서 전달되는 정보를 위한 기능들을 구현하기 위해 초기화를 시켜줄 때 필요
    super.onReady();

    // _user 변수 초기화(사용자의 정보 전달)
    _user = Rx<User?>(authentication.currentUser);
    // Rx<User?>로 타입 캐스팅

    // 유저 행동 정보 실시간 추적(전달): 로그인/로그아웃
    _user.bindStream(authentication.userChanges());

    // ever(listener, callback): 반응형 상태 값이 변경될 때 마다 호출
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) {
    if (user == null) {
      // 로그인 한 사용자가 없다면, 로그인 페이지로 이동
      // Get.offAll(() => NextPage());: 이전 페이지 모두 삭제 후 이동
      Get.offAll(() => LoginPage());
    } else {
      // Get.to(() => NextPage());: 기본 이동
      Get.to(() => WelcomePage());
    }
  }

  // 회원가입 및 로그인 기능
  void register(String email, password, name) async {
    try {
      isLoading(true);
      await authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      String userId = authentication.currentUser!.uid; // user uid

      // Firestore 의 profiles collection에 user의 name 저장
      await db.collection('profiles').doc(userId).set({
        'name': name,
      });

      isLoading(false);
    } catch (e) {
      // 로그인 실패
      Get.snackbar(
        'Error Message',
        'User Message',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Registration is falled',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void logout() {
    isLoading(true);
    authentication.signOut();
    isLoading(false);
  }

  void login(String email, password) async {
    try {
      isLoading(true);
      await authentication.signInWithEmailAndPassword(
          email: email, password: password);
      isLoading(false);

      String userId = authentication.currentUser!.uid;
      await getUserName(userId);
    } catch (e) {
      Get.snackbar(
        'Error Message',
        'User Message',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Login is falled',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  getUserName(String userId) async {
    final docRef = await db.collection('profiles').doc(userId);
    final doc = await docRef.get();

    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      print(data);
      userProfile.value = data;
    } else {
      print('No document found for user: $userId');
    }
  }
}

// GetxController 의 LifeCycle 은 다음과 같습니다.

// onInit -  GetxController 가 생성될 때 호출
// onReady - GetxController 가 initialized 된 후 호출
// onClose -  GetxController 가 메모리에서 제거될 때 호출

// 반응형 상태 값은 변화를 감지하는 콜백함수를 제공합니다.

// ever - 반응형 상태 값이 변경될 때 마다 호출
// once - 반응형 상태 값이 처음 변경될 때 호출
// debounce - 반응형 상태 값의 마지막 변경 이후 특정 시간동안 변경이 없으면 호출
// interval - 반응형 상태 값이 변경되는 동안, 일정 간격으로 호출
