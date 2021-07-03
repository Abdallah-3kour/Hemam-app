import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hemam/maincontroller.dart';
import 'package:hemam/pages/orgUser/adminHome.dart';
import 'package:hemam/pages/orgUser/adminNet/adminNet.dart';
import 'package:hemam/pages/orgUser/contoler.dart';

class Form2 extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.black26,

          // Define the default font family.
          fontFamily: 'Almarai',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Almarai'),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text("انشاء حدث جديد"),
          centerTitle: true,
        ),
        body: body(context),
      ),
    );
  }
}

Widget body(context) {
  var _ = Get.put(ControlerForm1());
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          child: Text(
            "المعلومات مطلوبة",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: DropdownButtonFormField(
              hint: Text("نوع الحدث"),
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: Text("رياضة"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("فن"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("مسابقات"),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text("عمل تطوعي"),
                )
              ],
              onChanged: (value) {
                _.eventType = value;
                _.update();
              },
            )),
        Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              textDirection: TextDirection.rtl,
              textCapitalization: TextCapitalization.words,
              textAlign: TextAlign.right,
              onChanged: (v) {
                _.eventInfo = v;
                _.update();
              },
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  filled: true,
                  disabledBorder: InputBorder.none,
                  alignLabelWithHint: true,
                  labelText: " تفاصيل الحدث"),
              maxLines: 18,
            )),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  Get.defaultDialog(
                      textConfirm: "yes",
                      cancelTextColor: Colors.redAccent,
                      buttonColor: Colors.white,
                      titleStyle: TextStyle(
                          color: Colors.redAccent,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                      middleText: "are you sure?",
                      title: "cancel Event",
                      onCancel: () {},
                      onConfirm: () {
                        Get.back();
                        Get.back();
                        Get.back();
                      });
                },
                child: Column(
                  children: [Icon(Icons.cancel), Text("الغاء الامر")],
                ),
              ),
              FlatButton(
                onPressed: () {
                  if (isValide2().contains(0)) {
                    Get.defaultDialog(
                        confirm: FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("ok"),
                        ),
                        titleStyle: TextStyle(
                            color: Colors.redAccent,
                            fontStyle: FontStyle.normal,
                            fontSize: 20),
                        title: "Please Fill all fields!",
                        middleText: "you have some text field empty !");
                  } else {
                    //?Send and go to home page
                    Get.defaultDialog(
                        title: "جاري التحميل",
                        titleStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal),
                        content: CircularProgressIndicator());
                    readToken().then((value) {
                      isConnected().then((state) {
                        if (state) {
                          CreateEvent(
                                  value,
                                  _.eventName,
                                  _.dateTime,
                                  _.eventType,
                                  _.eventInfo,
                                  _.numberAllowd,
                                  _.timeTime)
                              .then((value) {
                            Get.back();
                            Get.back();
                            Get.back();
                            Get.back();
                            Get.defaultDialog(
                                title: "تم انشاء الحدث بنجاح",
                                titleStyle: TextStyle(
                                  fontSize: 25,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal),
                                content: Column(
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.green,
                                      size: 50,
                                    ),

                                  ],
                                ));
                          });
                        } else {
                          Get.back();
                          Get.defaultDialog(
                              titleStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15),
                              title: "خطأ",
                              content: Container(
                                margin: EdgeInsets.all(20),
                                color: Colors.grey[200],
                                width: 300,
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.wifi_off,
                                      size: 50,
                                    ),
                                    Text(
                                      "لقد قطع التصال ",
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ));
                        }
                      });
                    });

                    // Get.to(Form2());
                  }
                },
                child: Column(
                  children: [Icon(Icons.add), Text("انشاء")],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

List<int> isValide2() {
  List<int> log = [];
  var x = Get.put(ControlerForm1());
  print(x.eventType);
  if (x.eventInfo == "") {
    log.add(0);
  } else {
    log.add(1);
  }
  if (x.eventType == 0) {
    log.add(0);
  } else {
    log.add(1);
  }
  return log;
}
