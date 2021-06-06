// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class Test extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Stream'),),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context,snapshots){
//           return ListView.builder(
//             itemCount: snapshots.data.docs.length,
//             itemBuilder: (context,index) {
//               DocumentSnapshot course = snapshots.data.docs[index];
//               return ListTile(
//                 title: Text(course['username']),
//                 subtitle: Text(course['email']),
//               );
//             }
//           );
//
//         },
//       ),
//     );
//
//   }
//
// }