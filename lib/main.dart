import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hemam/maincontroller.dart';
import 'package:hemam/pages/normalUser/details.dart';
import 'package:hemam/pages/normalUser/sport_page.dart';
import 'package:hemam/pages/orgUser/adminHome.dart';
import 'package:hemam/pages/start_page.dart';
import 'package:http/http.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:hemam/pages/orgUser/adminNet/adminNet.dart';
import 'package:hemam/pages/normalUser/UserHome.dart';
import 'package:get/get.dart';

void main() {
  runApp(App());
}

class App extends GetWidget {
  @override
  Widget build(BuildContext context) {
    var _ = Get.put(mainController());
    readConfig().then((type) {
      if (type == null) {
        _.Page = StartPage();
        _.update();
      } else {
        if (type == "user") {
          _.Page = Home();
          _.update();
        }
        if (type == "org") {
          _.Page = AdminHome();
          _.update();
        }
      }
    });

    return GetMaterialApp(
        home: SplashScreen(
            loadingText: Text(
              "جاري التحميل",
              style: TextStyle(color: Colors.white),
            ),
            title: Text("Hemam App",
                style: TextStyle(color: Colors.white, fontSize: 30)),
            backgroundColor: Colors.blue[300],
            useLoader: false,
            seconds: 3,
            navigateAfterSeconds:
                GetBuilder<mainController>(builder: (__) => __.Page)),
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
            )));
  }
}

// isConnected().then((state) {
//               print(state);
//               if (state) {
//                 orgName(value).then((name) {
//                   // print(state);
//                   if (name == "وزارة الشباب") {
//                     _.Page = AdminHome();
//                     _.update();
//                   }
//                   print("got to org pages     3");
//                 });
//               } else {
//                 Get.defaultDialog(
//                     barrierDismissible: false,
//                     titleStyle: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 15),
//                     title: "خطأ",
//                     content: Container(
//                       margin: EdgeInsets.all(20),
//                       color: Colors.grey[200],
//                       width: 300,
//                       height: 300,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.wifi_off,
//                             size: 50,
//                           ),
//                           Text(
//                             "قطع الاتصال",
//                             style: TextStyle(fontSize: 20),
//                             textAlign: TextAlign.center,
//                           )
//                         ],
//                       ),
//                     ));
//               }
//             });
