import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jayambemandap/homepage.dart';
import 'package:jayambemandap/mandap.dart';
import 'package:jayambemandap/pdflist.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({
    super.key,
    required String firstName,
    required String villageName,
    required String date1,
    required String whatsApp,
  });

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("ઇન્ફોર્મેશન લિસ્ટ",
            style: TextStyle(fontSize: 22), textAlign: TextAlign.start),
      ),
      body: Padding(
        padding: EdgeInsets.all(7),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "નામ :-${info[index]['Name']}",
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.edit, size: 25),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, size: 25),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Confirmation"),
                                  content:
                                      Text("Are you sure you want to deleted?"),
                                  actions: [
                                    TextButton(
                                      child: Text("Yes"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text("No"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Text("તારીખ :-${info[index]['Date']}",
                        style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("ગામ:-${info[index]['Village']}",
                        style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "વોટ્સેપ નંબર:-${info[index]['Whatsapp Number']}",
                      style: TextStyle(fontSize: 16),
                    ),
                    // InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => PdfPage(),
                    //           ));
                    //     },
                    //     // Container(
                    //     //   alignment: Alignment.center,
                    //     //   margin:
                    //     //   EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    //     //   padding:
                    //     //   EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    //     //   decoration: BoxDecoration(
                    //     //       color: Colors.red,
                    //     //       border: Border.all(color: Colors.red),
                    //     //       borderRadius: BorderRadius.circular(5)),
                    //     //   child: Row(
                    //     //     mainAxisSize: MainAxisSize.min,
                    //     //     children: [
                    //     //       Text(
                    //     //         "PDF Download",
                    //     //         style: TextStyle(
                    //     //             color: Colors.white,
                    //     //             fontWeight: FontWeight.bold,
                    //     //             fontSize: 20),
                    //     //       )
                    //     //     ],
                    //     //   ),
                    //     // ),
                    //     ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            elevation: 5,
                            fixedSize: Size(150, 20),
                          ),
                          child: Text("PDF Download"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfPage(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, index) {
              return SizedBox(
                height: 5,
              );
            },
            itemCount: info.length),
      ),
    );
  }

  List<dynamic> info = [];

  Future<void> getInfo() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      Map<String, dynamic> data =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      info.add(data);
    }
    setState(() {});
  }
}
