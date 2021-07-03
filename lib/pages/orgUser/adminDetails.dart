import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:hemam/pages/orgUser/adminHome.dart';

import 'package:hemam/pages/orgUser/adminNet/adminNet.dart';

import 'package:get/get.dart';
import 'contoler.dart';

class AdminDetails extends GetWidget {
  String postId;
  String eventName;
  String eventInfo;
  String numberAllowd;
  String eventType;

  AdminDetails(String _postId, String _eventName, String _eventInfo,
      String _numberAllowd, String _eventType) {
    this.postId = _postId;
    this.eventName = _eventName;
    this.eventInfo = _eventInfo;
    this.numberAllowd = _numberAllowd;
    this.eventType = _eventType;
    var _ = Get.put(ControlerDetials());
    _.eventName = this.eventName;
    _.eventInfo = this.eventInfo;
    _.eventType = this.eventType;
    _.numberAllowd = this.numberAllowd;

    _.update();
  }

  @override
  Widget build(BuildContext context) {
    var _ = Get.put(ControlerDetials());
    return WillPopScope(
      onWillPop: () {
        print("back");
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        // ignore: missing_required_param
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          label: Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    Get.defaultDialog(
                        barrierDismissible: false,
                        titleStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal),
                        title: "تنويه",
                        confirm: FlatButton(
                          onPressed: () {
                            Get.offAll(AdminHome());
                          },
                          child: Text("نعم"),
                        ),
                        cancel: FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("لا"),
                        ),
                        middleText: "هل انت متأكد من الغاء الامر ؟");
                  },
                  child: Text(
                    "الغاء التعديل",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Get.defaultDialog(
                        barrierDismissible: false,
                        titleStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal),
                        title: "تنويه",
                        confirm: FlatButton(
                          onPressed: () {
                            Get.defaultDialog(
                                barrierDismissible: false,
                                title: "جاري الحذف",
                                titleStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal),
                                content: CircularProgressIndicator());
                            readToken().then((token) {
                              deleteEvent(token, this.postId).then((value) {
                                if (value["state"]) {
                                  Get.offAll(AdminHome());
                                }
                              });
                            });
                          },
                          child: Text("نعم"),
                        ),
                        cancel: FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("لا"),
                        ),
                        middleText: "هل انت متأكد من الحذف ؟");
                  },
                  child: Text(
                    "حذف الحدث",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _.update();
                    Get.defaultDialog(
                        barrierDismissible: false,
                        title: "جاري الحفظ",
                        titleStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal),
                        content: CircularProgressIndicator());

                    readToken().then((token) {
                      updateEventData(token, this.postId, _.eventName,
                              _.eventType, _.eventInfo, _.numberAllowd)
                          .then((value) {
                        if (value["state"]) {
                          Get.offAll(AdminHome());
                        } else {
                          Get.defaultDialog(
                              barrierDismissible: false,
                              title: "خطأ",
                              titleStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                              content: Text("لم يتم التعرف على الهوية"));
                        }
                      });
                    });
                  },
                  child: Text(
                    "حقظ التغييرات",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<ControlerDetials>(
            builder: (_) => Column(
              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 50),
                          width: 200,
                          color: Colors.white54,
                          child: DropdownButtonFormField(
                            hint: Text("نوع الحدث"),
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("رياضي"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("فني"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("سباق"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("تطوعي"),
                              )
                            ],
                            onChanged: (value) {
                              _.eventType = value.toString();

                              _.update();
                            },
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black26,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _.eventName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Get.bottomSheet(BottomSheet(
                                        enableDrag: false,
                                        builder: (x) => Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextField(
                                                onChanged: (v) {
                                                  _.eventName = v;
                                                  _.update();
                                                },
                                                decoration: InputDecoration(
                                                    labelText: "اسم الحدث"),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  FlatButton(
                                                    color: Colors.redAccent,
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text("الغاء الامر",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  FlatButton(
                                                    color: Colors.green,
                                                    onPressed: () {
                                                      _.eventName = _.eventName;
                                                      _.update();
                                                      Get.back();
                                                    },
                                                    child: Text("حفظ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        onClosing: () {},
                                      ));
                                    })
                              ],
                            ),
                            GetBuilder<ControlerDetials>(
                              builder: (x) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: []),
                                  FlatButton(
                                    onPressed: () {
                                      Get.bottomSheet(BottomSheet(
                                        enableDrag: false,
                                        builder: (x) => Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (v) {
                                                  _.numberAllowd = v;
                                                  _.update();
                                                },
                                                decoration: InputDecoration(
                                                    labelText: "عدد الطلبات "),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  FlatButton(
                                                    color: Colors.redAccent,
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text("الغاء الامر",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  FlatButton(
                                                    color: Colors.green,
                                                    onPressed: () {
                                                      _.numberAllowd =
                                                          _.numberAllowd;
                                                      _.update();
                                                      Get.back();
                                                    },
                                                    child: Text("حفظ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        onClosing: () {},
                                      ));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          _.numberAllowd,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 225,
                  child: FlatButton(
                    onPressed: () {
                      Get.bottomSheet(BottomSheet(
                        enableDrag: false,
                        builder: (x) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextField(
                                    textDirection: TextDirection.rtl,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textAlign: TextAlign.right,
                                    maxLines: 12,
                                    onChanged: (v) {
                                      _.eventInfo = v;
                                      _.update();
                                    },
                                    decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        filled: true,
                                        disabledBorder: InputBorder.none,
                                        alignLabelWithHint: true,
                                        labelText: " تفاصيل الحدث")),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FlatButton(
                                      color: Colors.redAccent,
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("الغاء الامر",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    FlatButton(
                                      color: Colors.green,
                                      onPressed: () {
                                        _.eventInfo = _.eventInfo;
                                        _.update();
                                        Get.back();
                                      },
                                      child: Text("حفظ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        onClosing: () {},
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("تعديل نص الحدث"),
                        Icon(Icons.edit),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    _.eventInfo,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Future<Null> selectDate(BuildContext context) async {
//   var x = Get.put(ControlerDetials());
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
//   }
//   x.update();
// }

// Future<Null> selectTime(BuildContext context) async {
//   var x = Get.put(ControlerDetials());
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
//     x.$timeTime = "$h:$m:00";
//     x.update();
//   }
//   x.update();
// }
