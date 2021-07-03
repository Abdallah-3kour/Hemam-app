// import 'package:flutter/material.dart';
// import 'package:get/state_manager.dart';

// class formController extends GetxController {
//   @override
//   void onReady() {
//     super.onReady();
//     print('formController Ready');
//   }

//   String firstName = "";
//   String parentName = "";
//   String lastName = "";
//   String numberPhone = "";
//   String email = "";
//   int gender = 0;
//   String age = "";
//   String fullname="";
// }
// class homeController extends GetxController {
//     Color color=Colors.blueAccent;
// }
// class postController extends GetxController {
//   @override
//   void onReady() {
//     super.onReady();
//     print('postController Ready');
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   List<POST_CONFIG> posts = [];
//   String eventInfo = "";

//   List<Widget> view = [
//     Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [CircularProgressIndicator(), Text("جاري التحميل")],
//       ),
//     )
//   ];
// }

// class POST_CONFIG {
//   String id;
//   String eventName;
//   String dateTime;
//   String timeTime;
//   String numberAllowd;
//   String eventType;
//   String eventInfo;

//   POST_CONFIG(String _id, String _eventName, String _dateTime, String _timeTime,
//       String _numberAllowd, String _eventType, String _eventInfo) {
//     this.id = _id;
//     this.eventName = _eventName;
//     this.dateTime = _dateTime;
//     this.timeTime = _timeTime;
//     this.numberAllowd = _numberAllowd;
//     this.eventType = _eventType;
//     this.eventInfo = _eventInfo;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class formController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    print('formController Ready');
  }

  String firstName = "";
  String parentName = "";
  String lastName = "";
  String numberPhone = "";
  String email = "";
  int gender = 0;
  String age = "";
  String fullname="";
}
class homeController extends GetxController {
    Color color=Colors.blueAccent;
}
class postController extends GetxController {
  List<POST_CONFIG> posts = [];
  String eventInfo = "";
  List<Widget> view = [
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator(), Text("جاري التحميل")],
      ),
    )
  ];
}
class artController extends GetxController {
  List<POST_CONFIG> posts = [];
  String eventInfo = "";
  List<Widget> view = [
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator(), Text("جاري التحميل")],
      ),
    )
  ];
}
class sportController extends GetxController {
  List<POST_CONFIG> posts = [];
  String eventInfo = "";
  List<Widget> view = [
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator(), Text("جاري التحميل")],
      ),
    )
  ];
}
class POST_CONFIG {
  String id;
  String eventName;
  String dateTime;
  String timeTime;
  String numberAllowd;
  String eventType;
  String eventInfo;

  POST_CONFIG(String _id, String _eventName, String _dateTime, String _timeTime,
      String _numberAllowd, String _eventType, String _eventInfo) {
    this.id = _id;
    this.eventName = _eventName;
    this.dateTime = _dateTime;
    this.timeTime = _timeTime;
    this.numberAllowd = _numberAllowd;
    this.eventType = _eventType;
    this.eventInfo = _eventInfo;
  }
}
