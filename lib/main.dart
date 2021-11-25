import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app_widget.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const AppFirebase());
  FirebaseFirestore.instance
      .collection("col")
      .doc("doc");
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Material(
              child: Center(
                child: Text(
                  "Não foi possível inicializar o Firebase",
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const AppWidget();
          } else {
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
