// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled11/services/database.dart';
// import 'package:untitled11/views/TestDart.dart';
// import 'package:untitled11/views/test.dart';
//
// class Searchscreenpartially extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }
//
// class _SearchState extends State<Searchscreenpartially> {
//   Database databaseMethods = new Database();
//   TextEditingController searchEditingController = new TextEditingController();
//   QuerySnapshot searchResultSnapshot;
//
//   bool isLoading = false;
//   bool haveUserSearched = false;
//
//   initiateSearch() async {
//     if (searchEditingController.text.isNotEmpty) {
//       print(searchEditingController.text);
//       setState(() {
//         isLoading = true;
//       });
//        userList();
//         setState(() {
//           isLoading = false;
//           haveUserSearched = true;
//         }
//         );
//       }
//     }
//
//
//
//
//   Widget userList() {
//
//     return haveUserSearched ?
//
//     StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection('users')
//           .where('username', isEqualTo: searchEditingController.text)
//           .snapshots(),
//       builder: (context, snapshots) {
//         return
//           ListView.builder(
//               shrinkWrap: true,
//               itemCount: snapshots.data.docs.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot course = snapshots.data.docs[index];
//                 return userTile(course['username'], course['email']);
//               });
//       },
//     ): Container();
//   }
//
//   Widget userTile(String userName, String userEmail) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 userName,
//                 style: TextStyle(color: Colors.black, fontSize: 16),
//               ),
//               Text(
//                 userEmail,
//                 style: TextStyle(color: Colors.blue, fontSize: 16),
//               )
//             ],
//           ),
//           Spacer(),
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(24)),
//               child: Text(
//                 "Message",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('search'),
//       ),
//       body: isLoading
//           ? Container(
//         child: Center(
//           child: CircularProgressIndicator(),
//         ),
//       )
//           : Container(
//         color: Colors.black12,
//         child: Column(
//           children: [
//             SingleChildScrollView(
//               child: Container(
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                 color: Color(0x54FFFFFF),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: searchEditingController,
//                         decoration: InputDecoration(
//                             hintText: "search username ...",
//                             hintStyle: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                             border: InputBorder.none),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         initiateSearch();
//
//                       },
//                       child: Container(
//                           height: 55,
//                           width: 55,
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [
//                                     const Color(0x36FFFFFF),
//                                     const Color(0x0FFFFFFF)
//                                   ],
//                                   begin: FractionalOffset.topLeft,
//                                   end: FractionalOffset.bottomRight),
//                               borderRadius: BorderRadius.circular(40)),
//                           padding: EdgeInsets.all(12),
//                           child: Image.asset(
//                             "assets/search.png",
//                             height: 55,
//                             width: 55,
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             userList()
//           ],
//         ),
//       ),
//     );
//   }
// }
