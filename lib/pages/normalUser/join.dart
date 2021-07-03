import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemam/maincontroller.dart';
import 'package:hemam/pages/Net/userNet.dart';
import 'package:hemam/pages/normalUser/UserHome.dart';
import 'package:hemam/pages/normalUser/userControler.dart';

class Join extends GetWidget {
  String postId;
  String eventName;
  String n;
  Join(String _postId, String _eventName) {
    this.postId = _postId;
    this.eventName = _eventName;
    this.n = _eventName;
    if (this.n.length > 20) {
      this.n = this.n.substring(0, 20) + "...";
    }
  }
  @override
  Widget build(BuildContext context) {
    var _ = Get.put(formController());

    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Get.defaultDialog(
            textConfirm: "نعم",
            textCancel: "لا",
            cancelTextColor: Colors.redAccent,
            buttonColor: Colors.white,
            titleStyle: TextStyle(
                color: Colors.redAccent,
                fontStyle: FontStyle.normal,
                fontSize: 15),
            middleText: "هل انت متأكد من الغاء الطلب",
            title: "الغاء الطلب",
            onCancel: () {},
            onConfirm: () {
              Get.back();
              Get.back();
            });
      },
      child: MaterialApp(
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
            title: Text("الانضمام الى ${this.n} "),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(

                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "المعلومات المطلوبة",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(

                  width: MediaQuery.of(context).size.width,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width*.3,
                      child: TextField(
                        onTap: () {},
                        textDirection: TextDirection.rtl,
                        textCapitalization: TextCapitalization.words,
                        textAlign: TextAlign.right,
                        onChanged: (v) {
                          _.lastName = v;
                          _.update();
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "اسم العائلة",
                            helperStyle: TextStyle()))),Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width*.3,
                      child: TextField(
                          onTap: () {},
                          textDirection: TextDirection.rtl,
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.right,
                          onChanged: (v) {
                            _.parentName = v;
                            _.update();
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "اسم الاب",
                              helperStyle: TextStyle()))),Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width*.3,
                      child: TextField(
                          onTap: () {},
                          textDirection: TextDirection.rtl,
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.right,
                          onChanged: (v) {
                            _.firstName = v;
                            _.update();
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "الاسم الاول",
                              helperStyle: TextStyle())))

                      ]),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                        onChanged: (v) {
                          _.email = v;
                          _.update();
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "البريد الالكتروني",
                            helperText: "ex:example@example.com"))),
                Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                        onChanged: (v) {
                          _.numberPhone = v;
                          _.update();
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "رقم الهاتف",
                            helperText: "ex:07XXXXXXXX"))),
                Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                        onChanged: (v) {
                          _.age = v;
                          _.update();
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "العمر",
                          border: OutlineInputBorder(),
                        ))),
                Container(
                    padding: EdgeInsets.all(10),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      hint: Text("الجنس"),
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("ذكر"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("انثى"),
                        )
                      ],
                      onChanged: (value) {
                        _.gender = value;
                        _.update();
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Get.defaultDialog(
                              textConfirm: "نعم",
                              textCancel: "لا",
                              cancelTextColor: Colors.redAccent,
                              buttonColor: Colors.white,
                              titleStyle: TextStyle(
                                  color: Colors.redAccent,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15),
                              middleText: "هل انت متأكد من الغاء الطلب",
                              title: "الغاء الطلب",
                              onCancel: () {},
                              onConfirm: () {
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
                                  child: Text("حسننا"),
                                ),
                                titleStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15),
                                title: "يرجى ملء الحقول بالكامل",
                                middleText: "يرجى التقيد بالتعليمات");
                          } else {
                            //   //?Send and go to home page
                            Get.defaultDialog(
                                barrierDismissible: false,
                                title: "جاري ارسال الطلب",
                                titleStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal),
                                content: CircularProgressIndicator());
                            isConnected().then((state) {
                              _.firstName="${_.firstName} ${_.parentName} ${_.lastName}";
                              _.update();
                              if (state) {
                                joinToEvent(
                                        this.eventName,
                                        _.fullname,
                                        _.age,
                                        _.gender.toString(),
                                        _.email,
                                        _.numberPhone)
                                    .then((value) {
                                  Get.offAll(Home());

                                  Get.defaultDialog(
                                      barrierDismissible: false,
                                      title: "تم ارسال الطلب بنجاح",
                                      titleStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal),
                                      confirm: FlatButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("متابعة"),
                                      ),
                                      content: Column(
                                        children: [
                                          Icon(
                                            Icons.done,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                          Text("سيتم الرد على الطلب قريبا")
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                          }
                        },
                        child: Column(
                          children: [Icon(Icons.send), Text("ارسال الطلب")],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<int> isValide2() {
  List<int> log = [];
  var x = Get.put(formController());

  var fn = x.firstName.trim();
  var pn = x.parentName.trim();
  var ln = x.lastName.trim();

  RegExp emailV = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (fn.length >0) {
    print("name:true");
    log.add(1);
  } else {
    print("name:false");
    log.add(0);
  }
  if (pn.length >0) {
    print("name:true");
    log.add(1);
  } else {
    print("name:false");
    log.add(0);
  }
  if (ln.length >0) {
    print("name:true");
    log.add(1);
  } else {
    print("name:false");
    log.add(0);
  }
  if (emailV.hasMatch(x.email)) {
    log.add(1);
    print("email:true");
  } else {
    print("email:false");
    log.add(0);
  }
  if (x.age.length >= 1) {
    print("age:true");
    log.add(1);
  } else {
    print("age:false");
    log.add(0);
  }
  if (x.numberPhone.length == 10) {
    print("phone:true");
    log.add(1);
  } else {
    print("phone:false");
    log.add(0);
  }
  if (x.gender == 0) {
    print("gender:false");
    log.add(0);
  } else {
    print("gender:true");
    log.add(1);
  }
  return log;
}
