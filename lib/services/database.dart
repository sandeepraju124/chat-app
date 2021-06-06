import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Database {






  FirebaseFirestore firestore = FirebaseFirestore.instance;


  // Future<bool> addChatRoom(chatRoom, chatRoomId) {
  //
  //   firestore.collection("chatRoom").doc(chatRoomId).set(chatRoom).catchError((e){print(e);});
  //
  // }


  creatChatRoom(String ChatRoomId,ChatRoomMap){
    firestore.collection("ChatRoomId").add(ChatRoomMap).catchError((e){
      print(e);
    });

  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    firestore
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }


Future<void> addUserInfo(userData) async {
      firestore.collection("users").add(userData).catchError((e) {
        print(e.toString());
      });
    }



  Future  getUserByUsername(String searchcontroler) async {
    return await firestore
        .collection("users")
        .where("username", isEqualTo: searchcontroler).snapshots();


    }

  getChats(String chatRoomId) async{
    return await firestore
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


  Future<void> addMessage(String chatRoomId, chatMessageData){

    firestore.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
      print(e.toString());
    });
  }




  getUserChats(String itIsMyName) async {
    return await firestore
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }





}
