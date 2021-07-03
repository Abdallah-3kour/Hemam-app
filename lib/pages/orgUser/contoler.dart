import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ControlerForm1 extends GetxController {
  var eventName = "";
  var dateTime = "0000/00/00";
  var timeTime = "00:00:00";
  var numberAllowd = "0";
  var eventType = 0;
  var eventInfo = "none";
}

class ControlerDetials extends GetxController {
  var $eventName = "";
  var $numberAllowd = "0";
  var $eventType = 0;
  var $eventInfo = "none";

  var eventName = "جاري التحميل";
  var numberAllowd = "جاري التحميل";
  var eventType = "جاري التحميل";
  var eventInfo = "جاري التحميل";
  Color colorDetils = Colors.grey;
}

class ControlerDrower extends GetxController {
  var orgName = "";
  Widget name = CircularProgressIndicator();
  List<Event> events = [];
  List<Widget> view = [
    Column(children: [CircularProgressIndicator(), Text("Loading")])
  ];
}

class Event {
  String date;
  String name;
  String id;
  String type;
  String time;
  Event(_name, _id, _date, _type, _time) {
    print(_type);
    this.name = _name;
    this.id = _id;
    this.type = _type;
    this.date = _date;
    this.time = _time;
  }
}
