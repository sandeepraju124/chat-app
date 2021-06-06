import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/services/auth.dart';
import 'package:untitled11/services/database.dart';
import 'package:untitled11/views/chatroom.dart';
import 'package:untitled11/views/helperfunctions.dart';
import 'package:untitled11/views/searchscreen.dart';


import 'TestDart.dart';

class MainBodyHome extends StatefulWidget{
  @override
  _MainBodyHomeState createState() => _MainBodyHomeState();
}

class _MainBodyHomeState extends State<MainBodyHome> {
  Stream chatRooms;


  @override
  void initState() {
    getUserInfo();
    getUserInfogetChats();
    print('name');
    print(Constants.myName);
    super.initState();
  }



  getUserInfo()async{
    SharedPreferences preps = await SharedPreferences.getInstance();
    Constants.myName = await preps.getString('username');
    // var thisismyname = preps.getString('username');
    // Constants.myName = await HelperFunctions.getUserNameSharedPreference();

  }
  getUserInfogetChats() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    Database().getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
      });
    });
  }
  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.docs.length,

            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
                child: ChatRoomsTile(
                  userName: snapshot.data.docs[index].data()['chatRoomId']
                      .toString()
                      .replaceAll("_", "")
                      .replaceAll(Constants.myName, ""),
                  chatRoomId: snapshot.data.docs[index].data()["chatRoomId"],

                ),
              );
            })
            : Container();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        child: chatRoomsList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Searchscreen()));
        },
      ),
    );
  }
}
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.person_search),
//         onPressed: (){
//           print(Constants.myName );
//           print('up');
//           Navigator.push(context, MaterialPageRoute(
//               builder: (context)=> Searchscreen()
//           ));
//         }
//
//     )
//     );
//
//   }
// }

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Chat(
              chatRoomId: chatRoomId,
            )
        ));
      },
      child: Container(
        // color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              padding:EdgeInsets.symmetric(horizontal: 10, vertical: 9) ,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  // gradient: LinearGradient(
                  //     begin: Alignment.centerLeft,
                  //     end: Alignment.centerRight,
                  //     colors: [Colors.purple, Colors.blue]),


                  borderRadius: BorderRadius.circular(30)),
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}