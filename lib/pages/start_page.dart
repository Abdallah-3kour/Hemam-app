import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:hemam/pages/Net/userNet.dart';
import 'package:hemam/pages/normalUser/UserHome.dart';
import 'package:hemam/pages/login.dart';

import 'package:hemam/strings.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StartPage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    // dialog for alert

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Column(
        children: [
          Container(
            color: Colors.blue[300],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Hemam",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "انطلاقا من رؤية سمو ولي العهد الامير الحسين بن عبد الله الثاني تم إطلاق التطبيق للتواصل مع الشباب لبناء مستقبل واعد يحمل التقدم والإنجاز",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        height: 2),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(50),
                  width: 150,
                  child: OutlineButton(
                    color: Colors.blue[300],
                    borderSide: BorderSide(color: Colors.white),
                    onPressed: () {
                    Get.offAll(Home());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("دخول",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.white),
                    color: Colors.blue[300],
                    onPressed: () {
                      Get.to(Login());
                    },
                    child: Text("تسجيل الدخول كمنظمة",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
