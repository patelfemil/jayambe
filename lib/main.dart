import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jayambemandap/splash.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );

  runApp(Admore());
}

class Admore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
