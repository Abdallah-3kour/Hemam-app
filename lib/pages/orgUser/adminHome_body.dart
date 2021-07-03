import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:hemam/pages/normalUser/postView.dart';
import 'package:hemam/pages/orgUser/adminDetails.dart';
import 'package:hemam/pages/orgUser/adminNet/adminNet.dart';
import 'package:hemam/pages/orgUser/contoler.dart';
import 'package:hemam/pages/orgUser/form1.dart';
import 'package:hemam/pages/orgUser/post.dart';
import 'package:intl/intl.dart';
import '../start_page.dart';
import 'contoler.dart';

Widget AdminHomeDrawer(context) {
  var x = Get.put(ControlerDrower());
  readToken().then((value) async {
    orgName(value).then((value) {
      x.orgName = value;
      x.name = Text(
        x.orgName,
        style: TextStyle(fontFamily: "Almarai"),
      );
      x.update();
    });
  });
  Init(context);

  return Container(
      color: Colors.white,
      child: DefaultTabController(
          length: 2,
          child: GetBuilder<ControlerDrower>(
              builder: (_) => Scaffold(
                    appBar: AppBar(
                        leading: Container(),
                        leadingWidth: 0,
                        actions: [
                          FlatButton(
                              onPressed: () => Get.to(Form1()),
                              child: Row(children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text(
                                  "انشاء حدث جديد",
                                  style: TextStyle(color: Colors.white),
                                )
                              ])),
                        ],
                        bottom: TabBar(
                          tabs: [
                            Tab(
                              icon: Icon(Icons.event_note),
                              text: "My Events",
                            ),
                            Tab(icon: Icon(Icons.settings), text: "الاعدادات"),
                          ],
                        ),
                        title: _.name),
                    body: TabBarView(
                      children: [myEvents(context), settings()],
                    ),
                  ))));
}

Widget myEvents(context) {
  var _ = Get.put(ControlerDrower());
  return Center(
      child: RefreshIndicator(
          onRefresh: () async {
            _.view = [
              Center(
                child: Text("جاري التحميل"),
              )
            ];

            await Init(context);
            _.update();
            return await Future.delayed(Duration(seconds: 4));
          },
          child: ListView(children: _.view)));
}

Widget settings() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 160,
        child: FlatButton(
          color: Colors.redAccent,
          onPressed: () {
            Get.defaultDialog(
                barrierDismissible: false,
                titleStyle: TextStyle(
                    fontWeight: FontWeight.normal, fontStyle: FontStyle.normal),
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
          },
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: Colors.white,
              ),
              Text(
                "تسجيل الخروج",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      )
    ],
  ));
}

Init(context) async {
  var x = Get.put(ControlerDrower());
  x.view = [
    Center(
      child: Text("جاري التحميل"),
    )
  ];
  x.events = [];
  x.update();
  readToken().then((value) async {
    orgEvents(value).then((value) {
      if (value["state"]) {
        value["data"].forEach((e) {
          x.events
              .add(Event(e["name"], e["id"], e["date"], e["type"], e["time"]));
          x.update();
        });

        x.view = x.events.map((e) {
          Color c = Colors.grey;
          if (e.type == "art") {
            c = Colors.blue[300];
          }
          if (e.type == "sport") {
            c = Colors.orange;
          }
          if (e.type == "competitons") {
            c = Colors.orange[300];
          }
          if (e.type == "volunteer") {
            c = Colors.greenAccent;
          }
          ////////////////////////////////
          if (e.type == "art") {
            e.type = "فني";
          }
          if (e.type == "sport") {
            e.type = "رياضي";
          }
          if (e.type == "competitons") {
            e.type = "سباق";
          }
          if (e.type == "volunteer") {
            e.type = "تطوعي";
          }
          x.update();
          return EventPost(context, e.id, c, e.name, e.date, e.type, e.time);
        }).toList();
        x.update();
      } else {
        x.view = [
          Container(
            margin: EdgeInsets.all(20),
            color: Colors.grey[200],
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.cancel_presentation,
                  size: 30,
                ),
                Text(
                  "لا يوجد ",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          )
        ];
        x.update();
      }
    });
  });
}
