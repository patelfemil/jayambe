import 'package:flutter/material.dart';
import 'package:jayambemandap/informationlist.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  bool value=false;
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    dataList.add({
      "text":"બર્થડે ડેકોરેશન",
      "count": "",
    });
    dataList.add({
      "text":"બલૂન ડેકોરેશન ",
      "count": "",
    });
    dataList.add({
      "text":"શ્રીમંત સંસ્કાર",
      "count": "",
    });
    dataList.add({
      "text":"હલ્દી ડેકોરેશન",
      "count": "",
    });
    dataList.add({
      "text":"સ્ટેજ ડેકોરેશન",
      "count": "",
    });
    dataList.add({
      "text":"રિંગ શિરોમણી",
      "count": "",
    });
    dataList.add({
      "text":"કાર ડેકોરેશન",
      "count": "",
    });
    dataList.add({
      "text":"કોલ્ડ ફાયર એન્ટ્રી",
      "count": "",
    });
    dataList.add({
      "text":"કોલ્ડ ફાયર ગન",
      "count": "",
    });
    dataList.add({
      "text":"મટકા એન્ટ્રી",
      "count": "",
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Text("ઈવેન્ટ અને ડેકોરેશન"),
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
                      decoration: InputDecoration(
                          hintText: "શોધો..", border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount : dataList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(value:dataList[index]['count'].toString().trim() ==""? false :true, onChanged: (bool?val){
                          setState(() {
                            value=val!;
                          });
                        }),
                        Text(
                          dataList[index]['text'],
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
                                if(value.isNotEmpty){
                                  dataList[index]['count'] = value;
                                  setState(() {});
                                }else{
                                  dataList[index]['count'] = "";
                                  setState(() {});
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "    ", border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext Context,int index) {
                return Divider(
                  color: Color(0xff000000),
                );
                },
            ),
            Container(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(value: false, onChanged: (bool? val) {}),
                  Text("અન્ય",style: TextStyle(fontSize: 15),),
                  Divider(color: Colors.black,),
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
                        hintText: "",border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
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
                    "આગળ વધો",
                    style: TextStyle(fontSize: 19,color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
