import 'package:kidsdev_teste/modules/quiz/quiz_page.dart';
import 'package:kidsdev_teste/shared/models/user_model.dart';
import 'package:kidsdev_teste/shared/themes/app_colors.dart';
import 'package:kidsdev_teste/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "assets/images/variaveis.png",
    "assets/images/operadores.png",
    "assets/images/if.png",
    "assets/images/laco_repeticao.png",
    "assets/images/lista.png",
    "assets/images/funcao.png",
  ];

  var des = "aaaaaaaa";
  var des1 = "bbbbbbbb";
  var des2 = "cccccccc";
  var des3 = "dddddddd";
  var des4 = "eeeeeeee";
  var des5 = "ffffffff";

  var link = '';  
  var link1 = '';
  var link2 = '';
  var link3 = '';
  var link4 = '';
  var link5 = '';

  Widget customcard(String langname, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: InkWell(
        onTap: () {
          _modal(context, langname, des);
        },
        child: Material(
          color: AppColors.primary,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(100.0),
                  child: SizedBox(
                    height: 90.0,
                    width: 90.0,
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    langname,
                    style: AppTextStyles.body20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: AppColors.primary,
          title: ListTile(
            title: Text.rich(
              TextSpan(text: "Olá, ", style: AppTextStyles.title, children: [
                TextSpan(text: widget.user.name, style: AppTextStyles.titleBold)
              ]),
              textAlign: TextAlign.start,
            ),
            trailing: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage(widget.user.photoURL!))),
            ),
          ),
          actions: [
            PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.logout, color: AppColors.black),
                      const SizedBox(width: 8),
                      const Text('Sair'),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
              ],
            ),
          ],
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(5),
        crossAxisCount: 2,
        children: <Widget>[
          customcard("Variaveis", images[0]),
          customcard("Operadores", images[1]),
          customcard("If/else", images[2]),
          customcard("laço", images[3]),
          customcard("Lista", images[4]),
          customcard("Função", images[5]),
        ],
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('clicou');
        Navigator.pushReplacementNamed(context, "/login");
        break;
    }
  }

  void _modal(context, langname, des) {
    var assettoload;

    if (langname == "Variaveis") {
      assettoload = des;
    } else if (langname == "Operadores") {
      assettoload = des1;
    } else if (langname == "If/else") {
      assettoload = des2;
    } else if (langname == "laço") {
      assettoload = des3;
    } else if (langname == "Lista") {
      assettoload = des4;
    } else {
      assettoload = des5;
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(28.0),
          child: SizedBox(
            height: 200,
            child: Center(
              child: Column(
                children: [
                  Text(assettoload),
                  Expanded(
                    child: Container(
                      width: 100,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            const _url = "https://flutter.io";
                            await canLaunch(_url)
                                ? await launch(_url)
                                : throw 'Could not launch $_url';
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.red, //background
                            onPrimary: AppColors.white, //font
                          ),
                          child: const Text('Aprender Mais')),
                      ElevatedButton(
                        child: const Text('Começar'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => GetJson(themeName: langname),
                          ));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
