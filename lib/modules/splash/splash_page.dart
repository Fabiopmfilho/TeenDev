import 'package:flutter/material.dart';
import 'package:kidsdev_teste/shared/auth/auth_controller.dart';
import 'package:kidsdev_teste/shared/themes/app_colors.dart';
import 'package:kidsdev_teste/shared/themes/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);

    return Scaffold(
      backgroundColor: AppColors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(text: "<Teen", style: AppTextStyles.splash, children: [
                TextSpan(text: 'Dev', style: AppTextStyles.splashBold),
                TextSpan(text: '/>', style: AppTextStyles.splash),
              ]),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/logomini.png', width: 200, height: 200),
          ],
        ),
      ),
    );
  }
}
