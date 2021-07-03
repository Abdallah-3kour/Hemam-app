import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

var url = 'https://hemam2020.herokuapp.com/';
Future<dynamic> joinToEvent(String eventName, String name, String age,
    String gender, String email, String phone) async {
  if (gender == "1") {
    gender = "ذكر";
  }
  if (gender == "2") {
    gender = "انثى";
  }
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  var data = await http.post(
    url + "apply",
    headers: header,
    body: jsonEncode(<String, String>{
      'eventName': eventName,
      'name': name,
      'email': email,
      'age': age,
      'gender': gender,
      'phone': phone,
    }),
  );
  var statebool = jsonDecode(data.body)["state"];

  return statebool;
}

// Future<dynamic> login(String email, String password) async {
//   Map<String, String> header = {
//     "Content-type": "application/json",
//     "Accept": "application/json"
//   };
//   var data = await http.post(
//     url + "login",
//     headers: header,
//     body: jsonEncode(<String, String>{
//       'email': email,
//       'password': password,
//     }),
//   );
//   var statebool = jsonDecode(data.body)["state"];

//   if (statebool == "true") {
//     return await {"state": statebool};
//   } else {
//     var token = jsonDecode(data.body)["token"];
//     return await {"state": statebool, "token": token};
//   }
// }
Future<dynamic> getPosts(String type) async {
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  http.Response data = await http.get(
    url + "get/$type",
    headers: header,
  );

  var res = jsonDecode(data.body);

  return res;
}

Future<dynamic> getPost(String id) async {
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  var data = await http
      .get(
    url + "id/$id",
    headers: header,
  )
      .catchError((err) {
    print(err);
  });

  var post = jsonDecode(data.body)[0]["text"];
  print(post);
  return post;
}
