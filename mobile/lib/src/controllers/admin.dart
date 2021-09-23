import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mobile/src/repositories/http_resquest_class.dart';
import 'package:mobile/src/screens/events_list.dart';
import 'package:mobile/src/screens/login.dart';

enum Auths { InitialValue, Loading, Loaded, LoadedError }

class AdminRole extends GetxController {
  Auths auths = Auths.InitialValue;
  RequestsCalls calls = RequestsCalls();
  FlutterSecureStorage storage = FlutterSecureStorage();

  void loginAdmin({
    required String email,
    required String password,
  }) async {
    auths = Auths.Loading;
    update();
    try {
      final response = await calls
          .loginPost("admin/login", {"email": email, "password": password});

      Get.to(EventsScreen());
      auths = Auths.Loaded;
      update();
    } catch (e) {
      print(e);
      auths = Auths.LoadedError;
      update();
    }
  }

  void logoutAdmin(BuildContext context) async {
    storage.delete(key: "token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
