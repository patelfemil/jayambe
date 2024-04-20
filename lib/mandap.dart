import 'package:flutter/material.dart';
import 'package:jayambemandap/homepage.dart';
import 'package:jayambemandap/vasan.dart';

class MandapPage extends StatefulWidget {
  const MandapPage({super.key});

  @override
  State<MandapPage> createState() => _MandapPageState();
}

class _MandapPageState extends State<MandapPage> {
  TextEditingController searchText = TextEditingController();
  List<Map<String, dynamic>> dataList = [];
  List<Map<String, dynamic>> filterDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList.add({
      "text": "મંડપ (૧ ગાળાના ૫૦૦)",
      "eng_text": "Mandap",
      "count": "",
    });
    dataList.add({
      "text": "કારપેટ",
      "eng_text": "Carpet",
      "count": "",
    });
    dataList.add({
      "text": "ગાદલા (૧ નંગના ૨૦)",
      "eng_text": "Gadla",
      "count": "",
    });
    dataList.add({
      "text": "ખુરશી (૧ નંગના ૫)",
      "eng_text": "Khurshi",
      "count": "",
    });
    dataList.add({
      "text": "ટેબલ (૧નંગના ૫૦)",
      "eng_text": "Table",
      "count": "",
    });
    dataList.add({
      "text": "બુફે ટેબલ (૧ નંગના ૬૦)",
      "eng_text": "Bufe Table",
      "count": "",
    });
    dataList.add({
      "text": "સાઈડ બોર્ડર (૧×૧ સ્કેરફૂટના ૫)",
      "eng_text": "Side Border",
      "count": "",
    });
    dataList.add({
      "text": "ગેટ",
      "eng_text": "Geat",
      "count": "",
    });
    dataList.add({
      "text": "માંયરુ",
      "eng_text": "Mayru",
      "count": "",
    });
    dataList.add({
      "text": "સ્ટેજ (૮×૮ નંગના ૫૦૦)",
      "eng_text": "Stage",
      "count": "",
    });
    dataList.add({
      "text": "મરચાં મશીન",
      "eng_text": "Marcha Machine",
      "count": "",
    });
    dataList.add({
      "text": "મીઠાઇ ડીસ (૧ નંગના ૧૦)",
      "eng_text": "Mithay dish",
      "count": "",
    });
    dataList.add({
      "text": "થાળી (૧ નંગના ૧)",
      "eng_text": "Thari",
      "count": "",
    });
    dataList.add({
      "text": "વાટકી (૧ નંગના ૧)",
      "eng_text": "Vatki",
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
        title: Text("મંડપની યાદી "),
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
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      hintText: "શોધો..",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        filterDataList.clear();
                        for (int i = 0; i < dataList.length; i++) {
                          if (dataList[i]['eng_text']
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase())) {
                            filterDataList.add(dataList[i]);
                          }
                        }
                        setState(() {});
                      } else {
                        filterDataList.clear();
                        setState(() {});
                      }
                    },
                  )),
                  IconButton(
                    icon: Icon(Icons.search, size: 30),
                    onPressed: () {
                    },
                  )
                ],
              ),
            ),
            ListView.separated(
              itemCount: searchText.text.isEmpty
                  ? dataList.length
                  : filterDataList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black12)
                        shape: BoxShape.rectangle),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                            value: searchText.text.isEmpty
                                ? dataList[index]['count'].toString().trim() ==
                                        ""
                                    ? false
                                    : true
                                : filterDataList[index]['count']
                                            .toString()
                                            .trim() ==
                                        ""
                                    ? false
                                    : true,
                            onChanged: (bool? val) {}),
                        Text(
                          searchText.text.isEmpty
                              ? dataList[index]['text']
                              : filterDataList[index]['text'],
                          style: TextStyle(fontSize: 15),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.zero),
                          child: SizedBox(
                              width: 50,
                              height: 50,
                              child: TextField(
                                onChanged: (value) {
                                  if (searchText.text.isEmpty) {
                                    if (value.isNotEmpty) {
                                      dataList[index]['count'] = value;
                                    } else {
                                      dataList[index]['count'] = "";
                                    }
                                  } else {
                                    if (value.isNotEmpty) {
                                      filterDataList[index]['count'] = value;
                                      for (int i = 0;
                                          i < dataList.length;
                                          i++) {
                                        if (dataList[i]['eng_text'] ==
                                            filterDataList[index]['eng_text']) {
                                          dataList[i]['count'] = value;
                                        }
                                      }
                                    } else {
                                      filterDataList[index]['count'] = "";
                                      for (int i = 0;
                                          i < dataList.length;
                                          i++) {
                                        if (dataList[i]['eng_text'] ==
                                            filterDataList[index]['eng_text']) {
                                          dataList[i]['count'] = "";
                                        }
                                      }
                                    }
                                  }
                                  setState(() {});
                                },
                                controller: TextEditingController(
                                    text: searchText.text.isEmpty
                                        ? dataList[index]['count']
                                        : filterDataList[index]['count']),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: "    ", border: InputBorder.none),
                              )),
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 7,
                        //   ),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black),
                        //       borderRadius: BorderRadius.circular(10)),
                        //   child: SizedBox(
                        //       width: 60,
                        //       height: 50,
                        //       child: TextField(
                        //         keyboardType: TextInputType.number,
                        //         textAlign: TextAlign.center,
                        //         decoration: InputDecoration(
                        //           hintText: "    ",
                        //           border: InputBorder.none,
                        //         ),
                        //       )),
                        // ),
                      ],
                    ));
              },
              separatorBuilder: (BuildContext Context, int index) {
                return const Divider(
                  color: Color(0xff000000),
                );
              },
            ),
            Container(
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? val) {}),
                  Text(
                    "અન્ય",
                    style: TextStyle(fontSize: 15),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff000000)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 159,
                    width: 360,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "     ",
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Container(
                height: 52,
                width: 365,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "આગળ વધો",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
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
