// import 'dart:io';
//
// // import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/basic.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:video_player/video_player.dart';
//
// class ImageUpload extends StatefulWidget {
//   @override
//   _ImageUploadState createState() => _ImageUploadState();
// }
//
// class _ImageUploadState extends State<ImageUpload> {
//   File _image;
//   Future getImage() async {
//     var image = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       _image = image;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Picker Example'),
//       ),
//       body: Center(
//         child: _image == null ? Text('No image selected.') : Image.file(_image),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImage,
//         tooltip: 'Pick Image',
//         child: Icon(Icons.image),
//       ),
//     );
//   }
// }