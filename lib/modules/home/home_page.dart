import 'package:kidsdev_teste/modules/quiz/quiz_page.dart';
import 'package:kidsdev_teste/shared/models/user_model.dart';
import 'package:kidsdev_teste/shared/themes/app_colors.dart';
import 'package:kidsdev_teste/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

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

  Widget customcard(String langname, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJson(themeName: langname),
          ));
        },
        child: Material(
          color: Colors.indigoAccent,
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
                    children: const <Widget>[
                      Icon(Icons.logout, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Sair'),
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
        
        break;
    }
  }
}
