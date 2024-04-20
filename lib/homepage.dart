import 'package:flutter/material.dart';
import 'package:jayambemandap/vasan.dart';
import 'event.dart';
import 'mandap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("જયઅંબે મંડપ ડેકોરેશન "),
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline, size: 30),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MandapPage(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "મંડપ",
                      style: TextStyle(fontSize: 22,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VasanPage(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "વાસણ",
                      style: TextStyle(fontSize: 22,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            //   decoration: BoxDecoration(
            //       color: Colors.red,
            //       border: Border.all(color: Colors.brown),
            //       borderRadius: BorderRadius.circular(10)),
            //   height: 50,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "ઈવેન્ટ અને ડેકોરેશન",
            //         style: TextStyle(fontSize: 22,color: Colors.white),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        )
    );
  }
}
