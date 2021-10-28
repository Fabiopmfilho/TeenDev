import 'package:flutter/material.dart';
import 'package:kidsdev_teste/modules/home/home_page.dart';
import 'package:kidsdev_teste/modules/splash/splash_page.dart';
import 'package:kidsdev_teste/shared/models/user_model.dart';

import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KidsDev',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
