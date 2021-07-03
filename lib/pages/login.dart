import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:hemam/maincontroller.dart';
import 'package:hemam/pages/Net/userNet.dart';
import 'package:hemam/pages/loginController.dart';
import 'package:hemam/pages/normalUser/UserHome.dart';
import 'package:hemam/pages/orgUser/adminNet/adminNet.dart';
import 'package:hemam/strings.dart';
import 'package:get/get.dart';

import 'orgUser/adminHome.dart';

class Login extends GetWidget {
  @override
  Widget build(BuildContext context) {
    var _ = Get.put(loginController());
    RegExp emailV = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue[300],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hemam",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            helperText: "Ex:foo@example.com",
                            labelText: "البريد الالكتروني",
                          ),
                          onChanged: (v) {
                            _.email = v;
                            _.update();
                          },
                        ),
                        TextField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          onChanged: (v) {
                            _.password = v;
                            _.update();
                          },
                          decoration: InputDecoration(labelText: "كلمة المرور"),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: FlatButton(
                              color: Colors.blueAccent,
                              child: Text("تسجيل الدخول",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                if (emailV.hasMatch(_.email)) {
                                  if (_.password.length >= 10) {
                                    Get.defaultDialog(
                                        barrierDismissible: false,
                                        title: "يرجى الانتظار",
                                        titleStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15),
                                        content: CircularProgressIndicator());

                                    isConnected().then((state) {
                                      if (state) {
                                        login(_.email, _.password)
                                            .then((value) {
                                          Get.back();
                                          // print(value);
                                          if (value["state"] == true) {
                                            saveToken(value["token"]);

                                            Get.offAll(AdminHome());
                                            Get.rawSnackbar(
                                                message:
                                                    "تم تسجيل الدخول بنجاح",
                                                icon: Icon(
                                                  Icons.done,
                                                  color: Colors.green,
                                                ));
                                          } else {
                                            Get.rawSnackbar(
                                                message: " خطأ في تسجل الدخول ",
                                                icon: Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ));
                                          }
                                        });
                                      } else {
                                        Get.back();
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.wifi_off,
                                                    size: 50,
                                                  ),
                                                  Text(
                                                    "لقد قطع التصال ",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              ),
                                            ));
                                      }
                                    });
                                  } else {
                                    Get.defaultDialog(
                                        barrierDismissible: false,
                                        title: "خطأ",
                                        titleStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.normal),
                                        content: Text("خطأ في كلمة المرور"));
                                  }
                                } else {
                                  Get.defaultDialog(
                                      barrierDismissible: false,
                                      title: "خطأ",
                                      titleStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal),
                                      content:
                                          Text("خطأ في البريد الالكتروني"));
                                }
                              }),
                        ),
                        // FlatButton(
                        //   child: Text("forget password?",
                        //       style: TextStyle(color: Colors.grey)),
                        //   onPressed: () {
                        //     Get.to(AdminHome());
                        //   },
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
