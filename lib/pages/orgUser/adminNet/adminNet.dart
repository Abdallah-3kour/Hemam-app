import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

var url = 'https://hemam2020.herokuapp.com/';
Future<dynamic> login(String email, String password) async {
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  var data = await http.post(
    url + "login",
    headers: header,
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  var statebool = jsonDecode(data.body)["state"];

  if (statebool == "true") {
    return {"state": statebool};
  } else {
    var token = jsonDecode(data.body)["token"];
    return {"state": statebool, "token": token};
  }
}

Future<dynamic> CreateEvent(
    token, eventName, date, type, eventInfo, numberAllowed, time) async {
  if (type == 1) {
    type = "sport";
  }
  if (type == 2) {
    type = "art";
  }
  if (type == 3) {
    type = "competitons";
  }
  if (type == 4) {
    type = "volunteer";
  }
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Authorization": token
  };
  var data = await http.post(
    url + "createEvent",
    headers: header,
    body: jsonEncode(<String, String>{
      'eventName': eventName,
      'date': date,
      'type': type,
      'eventInfo': eventInfo,
      'numberAllowed': numberAllowed,
      'time': time
    }),
  );
  var statebool = jsonDecode(data.body)["state"];
  return statebool;
}

Future<String> orgName(String token) async {
  print("call orgname");
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Authorization": token
  };
  var data = await http.get(url + "orgName", headers: header);

  var name = jsonDecode(data.body)["name"];
  print(name);
  return name;
}

Future<dynamic> orgEvents(String token) async {
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Authorization": token
  };
  var data = await http.get(url + "events", headers: header);

  var events = jsonDecode(data.body);

  return events;
}

Future<dynamic> updateEventData(
    token, postId, eventName, type, eventInfo, numberAllowed) async {
  if (type == "1") {
    type = "sport";
  }
  if (type == "2") {
    type = "art";
  }
  if (type == "3") {
    type = "competitons";
  }
  if (type == "4") {
    type = "volunteer";
  }
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Authorization": token
  };
  var res = await http.post(
    url + "update/",
    headers: header,
    body: jsonEncode(<String, String>{
      'eventName': eventName,
      'type': type,
      'eventInfo': eventInfo,
      'numberAllowed': numberAllowed,
      'postId': postId,
    }),
  );
  print(res.body);
  if (res.statusCode == 200) {
    var statebool = await jsonDecode(res.body);
    return await statebool;
  }
}

Future<dynamic> deleteEvent(token, postId) async {
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Authorization": token
  };
  var res = await http.post(
    url + "deletePost/",
    headers: header,
    body: jsonEncode(<String, String>{
      'postId': postId,
    }),
  );
  print(res.body);
  if (res.statusCode == 200) {
    var statebool = await jsonDecode(res.body);
    return await statebool;
  }
}

Future<dynamic> getPostAdmin(String id) async {
  Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  var data = await http.get(
    url + "id/$id",
    headers: header,
  );

  var post = jsonDecode(data.body)[0];
  print(post);
  return post;
}

Future<String> getFilePath() async {
  Directory appDocumentsDirectory = await getExternalStorageDirectory(); // 1
  String appDocumentsPath = appDocumentsDirectory.path; // 2
  String filePath = '$appDocumentsPath/tc.json'; // 3

  return filePath;
}

Future<String> getFilePathConfig() async {
  Directory appDocumentsDirectory = await getExternalStorageDirectory(); // 1
  String appDocumentsPath = appDocumentsDirectory.path; // 2
  String filePath = '$appDocumentsPath/config.json'; // 3

  return filePath;
}

// Future<bool> saveToken(String token) async {
//   File file = File(await getFilePath()); // 1
//   file.writeAsString(token);

//   return file.exists();
// }

// Future<String> readToken() async {
//   File file = File(await getFilePath()); // 1
//   String content = await file.readAsString(); // 2
//   return content;
// }

// Future<bool> saveConfig(String config) async {
//   File file = File(await getFilePathConfig()); // 1
//   file.writeAsString(config);
//   return file.exists();
// }

// Future readConfig(dynamic callback) async {
//   File file = File(await getFilePathConfig()); // 1

//   file.exists().then((value) async {
//     if (value) {
//       String content = await file.readAsString();
//       callback({"state": value, "value": content});
//     } else {
//       callback({"state": value});
//     }
//   });
// }

Future<bool> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
  return true;
}

Future<String> readToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("token");
  ;
}

Future<bool> saveConfig(String type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("type", type);
  return true;
}

Future<String> readConfig() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("type");
}

Future<bool> deleteAlldata() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("type");
  prefs.remove("token");
  return true;
}
