import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:hemam/pages/orgUser/adminHome_body.dart';
import 'package:hemam/pages/orgUser/adminNet/adminNet.dart';


class AdminHome extends GetWidget {
  @override
  Widget build(BuildContext context) {
    saveConfig("org");
    return Scaffold(
      body: AdminHomeDrawer(context),
    );
  }
}

// Widget body(context) {
//   return Center(
//     child: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           home_card("Competitions", Colors.orange[200], context, () {
//             Get.to(AdminComp());
//           }),
//           home_card("Sport", Colors.orange, context, () {
//             Get.to(AdminSport());
//           }),
//           home_card("Arts", Colors.blueAccent, context, () {
//             Get.to(AdminArts());
//           }),
//           home_card("Volunteer work", Colors.greenAccent, context, () {
//             Get.to(AdminVolunteer());
//           })
//         ],
//       ),
//     ),
//   );
// }

// Widget home_card(title, color, context, onPressed) {
//   return Container(
//     margin: EdgeInsets.all(10),
//     child: FlatButton(
//       color: color,
//       height: 100,
//       onPressed: () => onPressed(),
//       child: Row(
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//           )
//         ],
//       ),
//     ),
//   );
// }
