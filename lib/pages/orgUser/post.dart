import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'adminNet/adminNet.dart';
import 'adminDetails.dart';

// Widget adminPost(
//   context,
// ) {
//   return Container(
//     margin: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey[300])]),
//     height: 300,
//     child: FlatButton(
//       onPressed: () {
//         // Get.to(Details());
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             height: 200.0 - 18,
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.all(5),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(5)),
//             child: Text(
//               "Post",
//               style: TextStyle(fontSize: 13),
//             ),
//           ),
//           Row(
//             children: [Icon(Icons.calendar_today), Text("2020/09/20")],
//           ),
//           Row(
//             children: [Icon(Icons.access_time), Text("2020/09/20")],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               FlatButton(
//                 onPressed: () {
//                   // Get.to(Admin);
//                 },
//                 child: Row(
//                   children: [Text("Edit"), Icon(Icons.edit)],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

class EventPost extends Widget {
  BuildContext context;
  String date;
  String time;
  String postId;
  String eventName;
  Color color;
  String type;
  EventPost(BuildContext _context, String _postId, Color _color,
      String _eventName, String _date, String _type, String _time) {
    this.context = _context;
    this.postId = _postId;
    this.color = _color;
    this.eventName = _eventName;
    this.date = _date;
    this.type = _type;
    this.time = _time;
  }
  @override
  Element createElement() {
    // print("${this.eventName} ${this.date} ${this.type} ${this.time}");
    return StatelessElement(Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          Get.defaultDialog(
              barrierDismissible: false,
              title: "جاري التحميل",
              titleStyle: TextStyle(
                  fontWeight: FontWeight.normal, fontStyle: FontStyle.normal),
              content: CircularProgressIndicator());
          getPostAdmin(this.postId).then((value) {
            Get.back();

            Get.to(AdminDetails(value["id"], value["name"], value["text"],
                value["numberAllowd"], value["type"]));
          });
        },
        title: Text(this.eventName),
        subtitle: Text(this.type),
        trailing: Text(
          this.date,
          style: TextStyle(color: Colors.blue),
        ),
        leading: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: this.color),
        ),
      ),
    ));
  }
}
