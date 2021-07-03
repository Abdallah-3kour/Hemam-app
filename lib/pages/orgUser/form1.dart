import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hemam/pages/orgUser/contoler.dart';
import 'package:hemam/pages/orgUser/form2.dart';
import 'package:hemam/strings.dart';
import 'package:intl/intl.dart';
import 'adminHome.dart';

class Form1 extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text(aft6),
          centerTitle: true,
        ),
        body: body(context),
      ),
    );
  }
}

Widget body(context) {
  var x = Get.put(ControlerForm1());
  var year = DateTime.now().year.toInt();
  var month = DateTime.now().month.toInt();
  var day = DateTime.now().day.toInt();
  var times=DateFormat.yMEd().add_jms().format(DateTime.now());
  var time=times.split(" ")[2].split(":");

  var tiemR="${time[0]}:${time[1]}";
  var amOrpm=times.split(" ")[3];

  x.timeTime = "$tiemR $amOrpm";
  x.dateTime = "$year/$month/$day";
  x.update();
  return GetBuilder<ControlerForm1>(
    builder: (_) => SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              aft1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (v) {
                _.eventName = v;
                _.update();
              },
              decoration: InputDecoration(labelText: aft2),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       _.dateTime,
                //       style: TextStyle(color: Colors.blue),
                //     ),
                //     FlatButton(
                //       onPressed: () {
                //         selectDate(context);
                //       },
                //       child: Text(
                //         aft9,
                //         style: TextStyle(color: Colors.blue),
                //       ),
                //     )
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       _.timeTime,
                //       style: TextStyle(color: Colors.blue),
                //     ),
                //     FlatButton(
                //       onPressed: () {
                //         selectTime(context);
                //       },
                //       child: Text(
                //         aft9,
                //         style: TextStyle(color: Colors.blue),
                //       ),
                //     )
                //   ],
                // ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: 100,
                          child: TextField(
                            onChanged: (v) {
                              _.numberAllowd = v;
                              _.update();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(hintText: "0"),
                          )),
                      Container(
                        child: Text(
                          aft4,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                aft5,
                textAlign: TextAlign.center,
              )),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    Get.defaultDialog(
                        textConfirm: "yes",
                        cancelTextColor: Colors.redAccent,
                        buttonColor: Colors.white,
                        titleStyle: TextStyle(
                            color: Colors.redAccent,
                            fontStyle: FontStyle.normal,
                            fontSize: 20),
                        middleText: "هل انت متأكد ؟",
                        title: "الغاء الامر",
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () {
                          Get.back();
                          Get.back();
                          Get.back();
                        });
                  },
                  child: Column(
                    children: [Icon(Icons.cancel), Text(aft7)],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    if (isValide1().contains(0)) {
                      Get.defaultDialog(
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: "حسننا",
                          cancelTextColor: Colors.redAccent,
                          buttonColor: Colors.white,
                          titleStyle: TextStyle(
                              color: Colors.redAccent,
                              fontStyle: FontStyle.normal,
                              fontSize: 20),
                          title: "خطأ",
                          middleTextStyle: TextStyle(fontSize: 15),
                          middleText: aft10);
                    } else {
                      Get.to(Form2());
                    }
                  },
                  child: Column(
                    children: [Icon(Icons.navigate_next), Text(aft8)],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

// Future<Null> selectDate(BuildContext context) async {
//   var x = Get.put(ControlerForm1());
//   final DateTime picked = await showDatePicker(
//       context: context,
//       initialDatePickerMode: DatePickerMode.day,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2101),
//       initialDate: DateTime.now());
//   if (picked != null) {
//     var year = picked.year;
//     var month = picked.month;
//     var day = picked.day;
//     x.dateTime = "$year/$month/$day";
//     x.update();
//   }
// }

// Future<Null> selectTime(BuildContext context) async {
//   var x = Get.put(ControlerForm1());
//   final TimeOfDay picked = await showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//   );
//   if (picked != null) {
//     var h = picked.hour.toString();
//     var m = picked.minute.toString();
//     if (h.toString().length == 1) {
//       h = "0${picked.hour}";
//     }
//     if (m.toString().length == 1) {
//       m = "0${picked.minute}";
//     }
//     x.timeTime = "$h:$m:00";
//     x.update();
//   }
// }

List<int> isValide1() {
  List<int> log = [];
  var x = Get.put(ControlerForm1());
  if (x.eventName == "") {
    log.add(0);
  } else {
    log.add(1);
  }
  if (x.numberAllowd == "0") {
    log.add(0);
  } else {
    log.add(1);
  }
  return log;
}
