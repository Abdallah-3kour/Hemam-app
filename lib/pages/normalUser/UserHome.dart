// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/state_manager.dart';
// import 'package:hemam/maincontroller.dart';
// import 'package:hemam/pages/about.dart';
// import 'package:hemam/pages/normalUser/arts_page.dart';
// import 'package:hemam/pages/normalUser/comp_page.dart';

// import 'package:get/get.dart';
// import 'package:hemam/pages/normalUser/sport_page.dart';
// import 'package:hemam/pages/normalUser/userControler.dart';
// import 'package:hemam/pages/normalUser/volunteer_page.dart';
// import 'package:hemam/pages/orgUser/adminNet/adminNet.dart';
// import 'package:hemam/pages/start_page.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:hemam/pages/about.dart';
import 'package:hemam/pages/normalUser/arts_page.dart';
import 'package:hemam/pages/normalUser/comp_page.dart';
import 'package:get/get.dart';
import 'package:hemam/pages/normalUser/sport_page.dart';
import 'package:hemam/pages/normalUser/userControler.dart';
import 'package:hemam/pages/normalUser/volunteer_page.dart';
import 'package:hemam/pages/orgUser/adminNet/adminNet.dart';
import 'package:hemam/pages/start_page.dart';
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var _ = Get.put(homeController());
//     return new MaterialApp(
//       theme: ThemeData(
//           // Define the default brightness and colors.
//           brightness: Brightness.light,
//           primaryColor: _.color,
//           accentColor: Colors.black26,
//
//           // Define the default font family.
//           fontFamily: 'Almarai',
//
//           // Define the default TextTheme. Use this to specify the default
//           // text styling for headlines, titles, bodies of text, and more.
//           textTheme: TextTheme(
//             headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//             headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//             bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Almarai'),
//           )),
//       color: Colors.yellow,
//       home: GetBuilder<homeController>(
//         builder: (x) => DefaultTabController(
//           length: 4,
//           child: new Scaffold(
//             appBar: AppBar(
//               backgroundColor: _.color,
//               title: Text("Hemam"),
//               centerTitle: true,
//             ),
//             drawer: Drawer(
//               // Add a ListView to the drawer. This ensures the user can scroll
//               // through the options in the drawer if there isn't enough vertical
//               // space to fit everything.
//               child: ListView(
//                 // Important: Remove any padding from the ListView.
//                 padding: EdgeInsets.zero,
//                 children: <Widget>[
//                   DrawerHeader(
//                     child: Text(
//                       "Hemam App",
//                       style: TextStyle(color: Colors.white, fontSize: 30),
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                     ),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.info),
//                     title: Text('حول التطبيق'),
//                     onTap: () {
//                       Get.to(AboutUs());
//                       // Update the state of the app.
//                       // ...
//                     },
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.logout),
//                     title: Text('تسجيل الخروج'),
//                     onTap: () {
//                       Get.defaultDialog(
//                           barrierDismissible: false,
//                           titleStyle: TextStyle(
//                               fontWeight: FontWeight.normal,
//                               fontStyle: FontStyle.normal),
//                           title: "تنويه",
//                           confirm: FlatButton(
//                             onPressed: () {
//                               deleteAlldata();
//                               Get.offAll(StartPage());
//                             },
//                             child: Text("نعم"),
//                           ),
//                           cancel: FlatButton(
//                             onPressed: () {
//                               Get.back();
//                             },
//                             child: Text("لا"),
//                           ),
//                           middleText: "هل انت متأكد من تسجيل الخروج ؟");
//                       // Update the state of the app.
//                       // ...
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             body: TabBarView(
//               children: [
//                 Arts(),
//                 Sport(),
//                 Volunteer(),
//                 Comp(),
//               ],
//             ),
//             bottomNavigationBar: new TabBar(
//               onTap: (i) {
//                 if (i == 1) {
//                   _.color = Colors.blueAccent;
//                   _.update();
//                   context.dependOnInheritedWidgetOfExactType();
//                 }
//                 if (i == 2) {
//                   _.color = Colors.orange;
//                   _.update();
//                   context.dependOnInheritedWidgetOfExactType();
//                 }
//                 if (i == 3) {
//                   _.color = Colors.greenAccent;
//                   _.update();
//                 }
//                 if (i == 4) {
//                   _.color = Colors.orange[300];
//                   _.update();
//                 }
//               },
//               tabs: [
//                 Tab(
//                   text: "فن",
//                 ),
//                 Tab(
//                   text: "رياضة",
//                 ),
//                 Tab(
//                   text: "اعمال تطوعية",
//                 ),
//                 Tab(
//                   text: "مسابقات",
//                 ),
//               ],
//
//               labelColor: Colors.white,
//               unselectedLabelColor: Colors.white54,
//               indicatorSize: TabBarIndicatorSize.label,
//               // isScrollable: true,
//               // enableFeedback: true,
//               indicatorColor: Colors.white,
//               labelPadding: EdgeInsets.all(1),
//             ),
//             backgroundColor: _.color,
//           ),
//         ),
//       ),
//     );
//   }
// }

class Home extends GetWidget {
  @override
  Widget build(BuildContext context) {
    saveConfig("user");
    return Scaffold(
      body: body(context),
      appBar: AppBar(
        title: Text("Hemam"),
        centerTitle: true,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Hemam App",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('حول التطبيق'),
              onTap: () {
                Get.to(AboutUs());
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('تسجيل الخروج'),
              onTap: () {
                Get.defaultDialog(
                    barrierDismissible: false,
                    titleStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal),
                    title: "تنويه",
                    confirm: FlatButton(
                      onPressed: () {
                        deleteAlldata();
                        Get.offAll(StartPage());
                      },
                      child: Text("نعم"),
                    ),
                    cancel: FlatButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("لا"),
                    ),
                    middleText: "هل انت متأكد من تسجيل الخروج ؟");
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget body(context) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          home_card("مسابقات", Colors.orange[200], context, () {
            Get.to(Comp());
          }),
          home_card("رياضة", Colors.orange, context, () {
            Get.to(Sport());
          }),
          home_card("فنون", Colors.blueAccent, context, () {
            Get.to(Arts());
          }),
          home_card("أعمال تطوعية", Colors.greenAccent, context, () {
            Get.to(Volunteer());
          })
        ],
      ),
    ),
  );
}

Widget home_card(title, color, context, onPressed) {
  return Container(
    margin: EdgeInsets.all(10),
    child: FlatButton(
      color: color,
      height: 100,
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    ),
  );
}
