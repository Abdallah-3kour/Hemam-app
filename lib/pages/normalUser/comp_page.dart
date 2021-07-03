import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:hemam/pages/Net/userNet.dart';
import 'package:hemam/pages/normalUser/postView.dart';
import 'package:hemam/pages/normalUser/userControler.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:hemam/pages/Net/userNet.dart';
import 'package:hemam/pages/normalUser/postView.dart';
import 'package:hemam/pages/normalUser/userControler.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

import '../../maincontroller.dart';

class Comp extends GetWidget {
  @override
  Widget build(BuildContext context) {
    // POST_CONFIG(e["id"], e["name"], e["date"], "no",
    //       e["numberAllowd"], e["type"], e["text"])
    Init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("مسابقات"),
          backgroundColor: Colors.orange[200],
        ),
        body: Center(
            child: GetBuilder<postController>(
                builder: (x) => RefreshIndicator(
                      onRefresh: () async {
                        x.update();
                        x.view = [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                Text("جاري التحميل")
                              ],
                            ),
                          )
                        ];
                        x.update();
                        await Init(context);
                        x.update();
                        return await Future.delayed(Duration(seconds: 4));
                      },
                      child: ListView(
                        children: x.view,
                      ),
                    ))));
  }
}

Init(context) {
  var _ = Get.put(postController());
  _.posts = [];
  _.update();
  isConnected().then((state) {
    if (state) {
      getPosts("competitons").then((value) async {
        if (value["state"]) {
          value["data"].forEach((e) {
            _.posts.add(POST_CONFIG(e["id"], e["name"], e["date"], e["time"],
                e["numberAllowd"], e["type"], e["text"]));
          });
          if (value["state"] == false) {
            _.view = [Text("No Post")];
            _.update();
          } else {
            if (_.posts.length == 0) {
              _.view = _.view;
              _.update();
            } else {
              _.view = _.posts
                  .map((e) => Post(
                      context,
                      e.id,
                      "http://moy.gov.jo/sites/all/themes/moy/images/logo123.png",
                      "وزارة الشباب",
                      e.eventInfo,
                      Colors.orange[300],
                      e.numberAllowd,
                      e.eventName,
                      e.dateTime,e.timeTime))
                  .toList();
              _.update();
            }
          }
        } else {
          _.view = [
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
                    Icons.tag_faces_outlined,
                    size: 30,
                  ),
                  Text(
                    "لا يوجد",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )
          ];
          _.update();
        }
      });
    } else {
      _.view = [
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
                Icons.wifi_off,
                size: 50,
              ),
              Text(
                "لقد قطع الاتصال ",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ];
      _.update();
    }
  });
}
