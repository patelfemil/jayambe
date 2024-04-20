import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jayambemandap/homepage.dart';
import 'package:jayambemandap/informationlist.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController v1 = TextEditingController();
  TextEditingController w1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Image.asset(
              "assets/img/backg.jpg",
              width: 400,
              fit: BoxFit.cover,
            ),
            Container(
                margin: EdgeInsets.only(top: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                      "assets/img/ic_bapa.png",
                      height: 185,
                      width: 180,
                      fit: BoxFit.cover,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "શ્રી આડમોર, મોટા ફળિયા ",
                      style: TextStyle(fontSize: 32, color: Colors.red),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "આડમોર (મોટા ફળિયા )",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "નામ", border: InputBorder.none),
                              controller: name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Name";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              child: TextFormField(
                            keyboardType: TextInputType.datetime,
                            controller: date,
                            decoration: InputDecoration(
                                hintText: "તારીખ", border: InputBorder.none),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your date";
                              }
                            },
                          )),
                          IconButton(
                            icon: Icon(Icons.calendar_today, size: 30),
                            onPressed: () async {
                              DateTime? datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2023),
                                  lastDate: DateTime(2050));
                              if (datePicked != null) {
                                var d2 =
                                    DateFormat('dd/MM/yyyy').format(datePicked);
                                date.text = d2;
                                print(
                                    'Date Selected:${datePicked.year}-${datePicked.month}-${datePicked.day}');
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "ગામનું નામ",
                                  border: InputBorder.none),
                              controller: v1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your Village";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  counterText: "",
                                  hintText: "વોટ્સેપ નંબર",
                                  border: InputBorder.none),
                              controller: w1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your Whatsapp Number";
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: Image.asset("assets/img/wp.png",
                                height: 35, width: 35, fit: BoxFit.contain),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseFirestore.instance.collection("users").add({
                            "Name": name.text,
                            "Date": date.text,
                            "Village": v1.text,
                            "Whatsapp Number": w1.text,
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InformationPage(
                                    firstName: name.text,
                                    villageName: v1.text,
                                    date1: date.text,
                                    whatsApp: w1.text),
                              ));
                        }
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: 20,
                    //   ),
                    //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    //   decoration: BoxDecoration(
                    //       color: Colors.red,
                    //       border: Border.all(color: Colors.black),
                    //       borderRadius: BorderRadius.all(Radius.circular(10))),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         "Already Create account",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 19),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
