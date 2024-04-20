import 'package:flutter/material.dart';
import 'package:jayambemandap/ragister.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        // margin: EdgeInsets.only(left: 28,top: 238),
        child: Center(
          child: Image.asset(
            "assets/img/jayambe.png",
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Register(),
            ));
      },
    );
  }
}
