import 'package:flutter/material.dart';
import 'package:jayambemandap/informationlist.dart';

class VasanPage extends StatefulWidget {
  const VasanPage({super.key});

  @override
  State<VasanPage> createState() => _VasanPageState();
}

class _VasanPageState extends State<VasanPage> {
  TextEditingController searchText = TextEditingController();
  List<Map<String, dynamic>> vasanList = [];
  List<Map<String, dynamic>> filterVasanList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vasanList.add({
      "text": "તપેલા મોટા",
      "eng_text": "Tapela Mota",
      "count": "",
    });
    vasanList.add({
      "text": "તપેલા નાના",
      "eng_text": "Tapela Nana",
      "count": "",
    });
    vasanList.add({
      "text": "પિત્તળની થાળી",
      "eng_text": "Pitarni Thaali",
      "count": "",
    });
    vasanList.add({
      "text": "એલ્યુમિનિયમ ઢાંકણ",
      "eng_text": "Aluminium Dhakan",
      "count": "",
    });
    vasanList.add({
      "text": "સ્ટીલની છીણી",
      "eng_text": "Still ni Chini",
      "count": "",
    });
    vasanList.add({
      "text": "મીઠાઇ કટર",
      "eng_text": "Mithay Katar",
      "count": "",
    });
    vasanList.add({
      "text": "પેણા",
      "eng_text": "Penaa",
      "count": "",
    });
    vasanList.add({
      "text": "ચા ની ટ્રે",
      "eng_text": "Chaa ni tre",
      "count": "",
    });
    vasanList.add({
      "text": "તવેથા",
      "eng_text": "Taveshaa",
      "count": "",
    });
    vasanList.add({
      "text": "સ્ટીલ પવાલી",
      "eng_text": "Still ni Pavali",
      "count": "",
    });
    vasanList.add({
      "text": "ભાતની મોટી પનાત",
      "eng_text": "Bhaat ni Moti Panat",
      "count": "",
    });
    vasanList.add({
      "text": "ભાતની નાની પનાત",
      "eng_text": "Bhaat ni Nani Panat",
      "count": "",
    });
    vasanList.add({
      "text": "સ્ટીલ કુંડી",
      "eng_text": "Still ni Kundi",
      "count": "",
    });
    vasanList.add({
      "text": "સ્ટીલ તપેલી",
      "eng_text": "Still Tapeli",
      "count": "",
    });
    vasanList.add({
      "text": "સ્ટીલ તરભાણા",
      "eng_text": "Still tarbhan",
      "count": "",
    });
    vasanList.add({
      "text": "સ્ટીલ ડોલ",
      "eng_text": "Still Doll",
      "count": "",
    });
    vasanList.add({
      "text": "સ્ટીલ કમન્ડર",
      "eng_text": "Still Comndor",
      "count": "",
    });
    vasanList.add({
      "text": "શાકનો મોટો કળસો",
      "eng_text": "Saakno moto karso",
      "count": "",
    });
    vasanList.add({
      "text": "દાળ વગરનો કળસો",
      "eng_text": "Daal vagarno karshoo",
      "count": "",
    });
    vasanList.add({
      "text": "ભાટીયા",
      "eng_text": "Bhaatiya",
      "count": "",
    });
    vasanList.add({
      "text": "ડોયા",
      "eng_text": "Doyaa",
      "count": "",
    });
    vasanList.add({
      "text": "ચમચા",
      "eng_text": "Chamchaa",
      "count": "",
    });
    vasanList.add({
      "text": "અથાણાંના ચોમુખા",
      "eng_text": "Athnana Chamchaa",
      "count": "",
    });
    vasanList.add({
      "text": "સ્ટીલ જગ",
      "eng_text": "Still jug",
      "count": "",
    });
    vasanList.add({
      "text": "આલુમિનિયમ કુંડી",
      "eng_text": "Aliuminium kundi",
      "count": "",
    });
    vasanList.add({
      "text": "બાજની પણાથ",
      "eng_text": "Baaj ni panath",
      "count": "",
    });
    vasanList.add({
      "text": "સિન્ટેક્ષ ટાંકી",
      "eng_text": "Syntax tanki",
      "count": "",
    });
    vasanList.add({
      "text": "ગ્યાસના ચૂલા",
      "eng_text": "Geat",
      "count": "",
    });
    vasanList.add({
      "text": "અન્ય",
      "eng_text": "Others",
      "count": "",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Text("વાસણની યાદી"),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, size: 25),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchText,
                      decoration: InputDecoration(
                          hintText: "શોધો..", border: InputBorder.none),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          filterVasanList.clear();
                          for (int i = 0; i < vasanList.length; i++) {
                            if (vasanList[i]['eng_text']
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase())) {
                              filterVasanList.add(vasanList[i]);
                            }
                          }
                          setState(() {});
                        } else {
                          filterVasanList.clear();
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Table(
                border: TableBorder.all(color: Color(0xff000000)),
                columnWidths: const <int, TableColumnWidth>{
                  0: const FixedColumnWidth(50),
                  2: const FixedColumnWidth(90),
                },
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text("ક્રમ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text("વિગત",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text("નંગ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ])
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: searchText.text.isEmpty
                  ? vasanList.length
                  : filterVasanList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Table(
                    border: TableBorder.all(color: Color(0xff000000)),
                    columnWidths: const <int, TableColumnWidth>{
                      0: const FixedColumnWidth(50),
                      2: const FixedColumnWidth(90),
                    },
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("${index + 1}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                              searchText.text.isEmpty
                                  ? vasanList[index]["text"]
                                  : filterVasanList[index]['text'],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ),
                        TextField(
                          onChanged: (value) {
                            if (searchText.text.isEmpty) {
                              if (value.isNotEmpty) {
                                vasanList[index]['count'] = value;
                              } else {
                                vasanList[index]['count'] = "";
                              }
                            } else {
                              if (value.isNotEmpty) {
                                filterVasanList[index]['count'] = value;
                                for (int i = 0; i < vasanList.length; i++) {
                                  if (vasanList[i]['eng_text'] ==
                                      filterVasanList[index]['eng_text']) {
                                    vasanList[i]['count'] = value;
                                  }
                                }
                              } else {
                                filterVasanList[index]['count'] = "";
                                for (int i = 0; i < vasanList.length; i++) {
                                  if (vasanList[i]['eng_text'] ==
                                      filterVasanList[index]['eng_text']) {
                                    vasanList[i]['count'] = "";
                                  }
                                }
                              }
                            }
                            setState(() {});
                          },
                          controller: TextEditingController(
                              text: searchText.text.isEmpty
                                  ? vasanList[index]["count"]
                                  : filterVasanList[index]['count']),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "નંગ",
                            border: InputBorder.none,
                          ),
                        ),
                      ]),
                    ],
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformationPage(firstName: 'Name',date1: "Date",villageName: "Village",whatsApp: "Whatsapp Number"),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(2)),
                height: 52,
                width: 365,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Save",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
