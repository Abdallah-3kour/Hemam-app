import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hemam/after_laiout.dart';
import 'package:hemam/pages/normalUser/userControler.dart';
import '../Net/userNet.dart';
import 'package:get/state_manager.dart';
import 'package:hemam/pages/normalUser/join.dart';

import 'package:get/get.dart';

class PostDetails extends GetWidget {
  //!Event info just fetch from server
  String postId;
  String numberAllowd;
  Color colorDetails;
  String eventName;
  String orgImage;
  String date;
  String eventInfo;
  PostDetails(String _postId, String _numberAllowd, Color _colorDetails,
      String _eventName, String _orgImage, String _date) {
    this.postId = _postId;
    this.numberAllowd = _numberAllowd;
    this.eventName = _eventName;
    this.colorDetails = _colorDetails;
    this.orgImage = _orgImage;
    this.date = _date;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: missing_required_param
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // ignore: missing_required_param
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        label: Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.green,
                onPressed: () {
                  Get.to(Join(this.postId, this.eventName));
                },
                child: Text(
                  "انضمام",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                "${this.numberAllowd} : العدد المتاح ",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
      ),
      body: body(context),
    );
  }

  Widget body(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var x = Get.put(postController());
      x.eventInfo = "";
      getPost(this.postId).then((value) async {
        x.eventInfo = value;
        x.update();
      });
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: this.colorDetails),
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black26,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        this.eventName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Text(
                                    this.date,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GetBuilder<postController>(
            builder: (_) => Container(
              padding: EdgeInsets.all(20),
              child: _.eventInfo.length == 0
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                          Text("جاري التحميل")
                        ],
                      ),
                    )
                  : Text(
                      _.eventInfo,
                      textAlign: TextAlign.right,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
