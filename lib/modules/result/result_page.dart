import 'package:flutter/material.dart';

import 'package:kidsdev_teste/app_widget.dart';
import 'package:kidsdev_teste/shared/themes/app_colors.dart';
import 'package:kidsdev_teste/shared/themes/app_text_styles.dart';

class ResultPage extends StatefulWidget {
  int marks;
  ResultPage({
    Key? key,
    required this.marks,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState(marks);
}

class _ResultPageState extends State<ResultPage> {
  List<String> images = [
    "assets/images/success.png",
    "assets/images/good.png",
    "assets/images/bad.png",
  ];

  String? message;
  dynamic image;

  @override
  void initState() {
    if (marks == 0) {
      image = images[2];
      message = "Não desista, estude mais.\nSeu resultado $marks";
    } else if (marks <= 4) {
      image = images[2];
      message = "Você precisa estudar mais.\nSeu resultado $marks pontos";
    } else if (marks < 7) {
      image = images[1];
      message = "Parabens, mas pode melhorar..\nSeu resultado $marks pontos";
    } else {
      image = images[0];
      message = "Muito Bom!!!\nSeu resultado foi $marks pontos";
    }
    super.initState();
  }

  int marks;
  _ResultPageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  Material(
                    child: SizedBox(
                      width: 300.0,
                      height: 300.0,
                      child: ClipRect(
                        child: Image(
                          image: AssetImage(
                            image!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                        child: Text(
                          message!,
                          style: AppTextStyles.bodyBlack,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () async {
                    await Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => const AppWidget(),
                    ));
                  },
                  child: Text(
                    "Voltar",
                    style: AppTextStyles.heading,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide:
                       BorderSide(width: 3.0, color: AppColors.indigo),
                  splashColor: AppColors.primary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
