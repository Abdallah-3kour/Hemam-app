import 'package:fade/fade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemam/maincontroller.dart';

import '../../strings.dart';
import 'details.dart';

class Post extends Widget {
  BuildContext context;
  String time;
  String date;
  String orgImg;
  String postId;
  String orgName;
  String eventInfo;
  String eventName;
  String numberAllowd;
  Color readMoreColor;
  Post(
      BuildContext _context,
      String _postId,
      String _orgImg,
      String _orgName,
      String _eventInfo,
      Color _readMoreColor,
      String _numberAllowd,
      String _eventName,
      String _date,String _time) {
    this.context = _context;
    this.orgImg = _orgImg;
    this.orgName = _orgName;
    this.postId = _postId;
    this.eventInfo = _eventInfo;
    this.readMoreColor = _readMoreColor;
    this.numberAllowd = _numberAllowd;
    this.eventName = _eventName;
    this.time=_time;
    var year = DateTime.now().year.toInt();
    var month = DateTime.now().month.toInt();
    var day = DateTime.now().day.toInt();
    var dateTime = "$year/$month/$day";
    print("$dateTime  $_date");
    if(_date==dateTime){
      this.date="اليوم";
    }else{
      this.date=_date;
    }

    if (_eventInfo.length > 500) {
      this.eventInfo = _eventInfo.substring(0, 470) + "...قراءة المزيد";
    }
  }
  @override
  Element createElement() {
    return StatelessElement(Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey[300])]),
      height: MediaQuery.of(context).size.height * .5,
      child: Fade(
        duration: Duration(milliseconds: 1000),
        visible: true,
        child: FlatButton(
          onPressed: () {

            Get.to(PostDetails(
                this.postId,
                this.numberAllowd,
                this.readMoreColor,
                this.eventName,
                "https://random.dog/dd7513ef-2032-4c0e-bb4e-f076115bc9bf.jpg",
                this.date));
          },
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/logo123.png")),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${this.orgName}"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text(
                        "${this.date}",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),Container(
                          margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "${this.time}",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )],)
                    ],
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .3,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "${this.eventInfo}",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlineButton(
                      borderSide: BorderSide(color: this.readMoreColor),
                      child: new Text(
                        ct1,
                        style: TextStyle(color: this.readMoreColor),
                      ),
                      onPressed: () {
                        isConnected().then((state) {
                          if (state) {
                            Get.to(PostDetails(
                                this.postId,
                                this.numberAllowd,
                                this.readMoreColor,
                                this.eventName,
                                "https://random.dog/dd7513ef-2032-4c0e-bb4e-f076115bc9bf.jpg",
                                this.date));
                          } else {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                ));
                          }
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
