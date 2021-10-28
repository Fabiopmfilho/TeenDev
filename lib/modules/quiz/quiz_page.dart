import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidsdev_teste/modules/result/result_page.dart';
import 'package:kidsdev_teste/shared/themes/app_colors.dart';
import 'package:kidsdev_teste/shared/themes/app_text_styles.dart';

class GetJson extends StatelessWidget {
  final String? themeName;
  String? assettoload;
  GetJson({
    Key? key,
    this.themeName,
    this.assettoload,
  }) : super(key: key);

  // set json
  setAsset() {
    if (themeName == "Variaveis") {
      assettoload = "assets/data/python.json";
    } else if (themeName == "Operadores") {
      assettoload = "assets/data/java.json";
    } else if (themeName == "if/else") {
      assettoload = "assets/data/js.json";
    } else if (themeName == "Laço") {
      assettoload = "assets/data/cpp.json";
    } else if (themeName == "Lista") {
      assettoload = "assets/data/laco.json";
    } else {
      assettoload = "assets/data/linux.json";
    }
  }

  Future<String> fetchJson() async {
    if (assettoload == null) {
      return '';
    }
    var jsonPerguntas = await rootBundle.loadString(assettoload!);
    return jsonPerguntas;
  }

  @override
  Widget build(BuildContext context) {
    setAsset();

    return FutureBuilder<String>(
      future: fetchJson(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List mydata =
              snapshot.data!.isNotEmpty ? json.decode(snapshot.data!) : [];
          return QuizPage(mydata: mydata);
        } else {
          return const Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  final List mydata;

  const QuizPage({Key? key, required this.mydata}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {
  final List mydata;
  _QuizPageState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;
  int j = 1;
  int timer = 30;
  String showtimer = "30";
  var random_array;

  Map<String, Color> btnColor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };
  bool canceltimer = false;

  genRandomArray() {
    var distinctIds = [];
    var rand = Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10) + 1);
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  // start do contador
  @override
  void initState() {
    startTimer();
    genRandomArray();
    super.initState();
  }

  // chamando somente quando marcado
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextQuestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(marks: marks),
        ));
      }
      btnColor["a"] = Colors.indigoAccent;
      btnColor["b"] = Colors.indigoAccent;
      btnColor["c"] = Colors.indigoAccent;
      btnColor["d"] = Colors.indigoAccent;
      disableAnswer = false;
    });
    startTimer();
  }

  void checkAnswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 1;
      // cmudar a cor para verde
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btnColor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    // nextquestion();
    Timer(const Duration(seconds: 1), nextQuestion);
  }

  Widget choiceButton(String k) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkAnswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: AppTextStyles.body16,
          maxLines: 1,
        ),
        color: btnColor[k],
        splashColor: AppColors.button,
        highlightColor: AppColors.button,
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    "Espera ai!",
                  ),
                  content: const Text("Você não pode desistir agora."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: AppTextStyles.bodyBlack,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: AbsorbPointer(
                absorbing: disableAnswer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choiceButton('a'),
                    choiceButton('b'),
                    choiceButton('c'),
                    choiceButton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: AppTextStyles.timer,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
