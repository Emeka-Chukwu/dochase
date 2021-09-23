import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/src/controllers/admin.dart';
import 'package:mobile/src/cores/cores.dart';
import 'package:mobile/src/cores/margin.dart';
import 'package:mobile/src/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final login = Get.put(AdminRole());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInputFieldGeneric(
                  controller: emailController,
                  title: 'Enter your eamil',
                ),
                YMargin(20),
                TextInputFieldGeneric(
                  controller: passwordController,
                  title: 'Enter your password',
                  obscureText: true,
                ),
                YMargin(20),
                ButtonComp(
                  color: AppColor.blue,
                  onTap: () {
                    // Get.to(EventsScreen());
                    login.loginAdmin(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  title: 'Login',
                )
              ],
            ),
          ),
          GetBuilder<AdminRole>(builder: (_) {
            if (_.auths == Auths.Loading) {
              return ProgressBar();
            }
            return const SizedBox.shrink();
          }),
          // ProgressBar(),
        ],
      ),
    );
  }
}
