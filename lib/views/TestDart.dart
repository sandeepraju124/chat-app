// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Reverse ListView Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   final TextEditingController _textController = TextEditingController();
//
//   double _sizedBoxHeight;
//   Size _screenSize;
//   double _textHeight;
//   final GlobalKey _redKey = GlobalKey();
//   final GlobalKey _appBarKey = GlobalKey();
//   double appBarHeight;
//
//   List<Widget> widgets = [];
//
//   Size _getSizes(GlobalKey key) {
//     final RenderBox renderBoxRed = key.currentContext.findRenderObject();
//     final sizeRed = renderBoxRed.size;
//     return sizeRed;
//   }
//
//   num _textDetails(BuildContext context, [text = ""]) {
//     final TextPainter textPainter = TextPainter(
//       text: TextSpan(
//         text: text,
//         style: TextStyle(
//             color: Colors.black,
//             fontSize: Theme.of(context).textTheme.bodyText2.fontSize),
//       ),
//       textDirection: TextDirection.ltr,
//       textScaleFactor: MediaQuery.of(context).textScaleFactor,
//     )..layout(minWidth: 0, maxWidth: _screenSize.width);
//     if (text.isEmpty) {
//       return textPainter.size.height;
//     } else {
//       return textPainter.computeLineMetrics().length;
//     }
//   }
//
//   _insertBlanks() async {
//     final Size _appBarSize = _getSizes(_appBarKey);
//     final Size _containerSize = _getSizes(_redKey);
//
//     final int _blankLinesTotal = ((_screenSize.height -
//         _appBarSize.height -
//         _containerSize.height -
//         60) ~/
//         _textHeight);
//
//     final double blankLinesHeight = _textHeight * _blankLinesTotal;
//     _sizedBoxHeight = blankLinesHeight +
//         (_screenSize.height -
//             _appBarSize.height -
//             _containerSize.height -
//             60 -
//             blankLinesHeight);
//     widgets.insert(0, SizedBox(height: _sizedBoxHeight));
//     setState(() {});
//   }
//
//   void _addRequest(String text, BuildContext context) {
//     setState(() {
//       if (_sizedBoxHeight > 0) {
//         final int _numLines = _textDetails(context, text);
//         _sizedBoxHeight = _sizedBoxHeight - (_textHeight * _numLines);
//         widgets[widgets.length - 2] =
//             SizedBox(height: _sizedBoxHeight >= 0 ? _sizedBoxHeight : 0);
//       }
//       widgets.insert(0, Text(text));
//     });
//   }
//
//   @override
//   initState() {
//     super.initState();
//     final Widget intro = buildHelperIntro();
//     widgets.insert(0, intro);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _insertBlanks();
//     });
//   }
//
//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _screenSize = MediaQuery.of(context).size;
//     _textHeight = _textDetails(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         key: _appBarKey,
//         elevation: 0.0,
//         title: Text(widget.title),
//       ),
//       body: Container(
//         color: Colors.black12, // Why doesn't this fill the full ListView?
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: ListView.builder(
//                 reverse: true,
//                 itemBuilder: (_, index) => widgets[index],
//                 itemCount: widgets.length,
//               ),
//             ),
//             const Divider(height: 1.0),
//             Container(
//               decoration: BoxDecoration(color: Theme.of(context).cardColor),
//               child: _buildTextComposer(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildHelperIntro() {
//     return Container(
//       key: _redKey,
//       color: Colors.black12,
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 8.0),
//                   color: const Color(0xFF2196F3),
//                   child: const Text(
//                     "Hi! Try clicking an option below.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Options(
//             [
//               "Option number 1",
//               "Option number 2",
//               "Option number 3",
//               "Option number 4",
//               "Option number 5",
//             ],
//                 (text) {
//               _addRequest(text, context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   updateSubmitButton() {
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       // Force evaluation of _textController state.
//     });
//   }
//
//   void _handleSubmitted(String text, BuildContext context) {
//     _textController.clear();
//     FocusScope.of(context).requestFocus(FocusNode()); // dismiss keyboard.
//     updateSubmitButton();
//     _addRequest(text, context);
//   }
//
//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(color: Theme.of(context).accentColor),
//       child: Container(
//         height: 60.0,
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(children: <Widget>[
//           Flexible(
//             child: Card(
//               color: Colors.white,
//               shape: const RoundedRectangleBorder(
//                 side: BorderSide(
//                   color: Colors.black12,
//                 ),
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: TextField(
//                   controller: _textController,
//                   onChanged: (String text) {
//                     updateSubmitButton();
//                   },
//                   onSubmitted: (text) {
//                     _handleSubmitted(text, context);
//                   },
//                   decoration: const InputDecoration.collapsed(
//                     hintText: "Start typing...",
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//               child: IconButton(
//                 icon: const Icon(Icons.send, color: Color(0xFF2196F3)),
//                 onPressed: _textController.text.length > 0
//                     ? () => _handleSubmitted(_textController.text, context)
//                     : null,
//               )),
//         ]),
//       ),
//     );
//   }
// }
//
// typedef StringCallback(String text);
//
// class Options extends StatelessWidget {
//   final List<String> requests;
//   final StringCallback addRequest;
//
//   const Options(this.requests, this.addRequest);
//
//   @override
//   Widget build(BuildContext context) {
//     final children = List.generate(
//         2 * requests.length - 1,
//             (int index) => index % 2 == 0
//             ? _SingleRequest(requests[index ~/ 2], addRequest)
//             : const Divider(color: Colors.black));
//
//     return CustomPaint(
//       painter: _DrawArc(),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//         child: Card(
//           elevation: 10.0,
//           color: Colors.white,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(20.0))),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: children,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _SingleRequest extends StatelessWidget {
//   final String request;
//   final StringCallback addRequest;
//
//   const _SingleRequest(this.request, this.addRequest);
//
//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       onPressed: () {
//         addRequest(request);
//       },
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           const Padding(
//             padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 3.0),
//             child: CircleAvatar(
//               radius: 10.0,
//               backgroundColor: Color(0xFF2196F3),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(12.0, 6.0, 0.0, 4.0),
//             child: Text(
//               request,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _DrawArc extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     const padH = 52.0;
//     final Paint paint = Paint()..color = const Color(0xFF2196F3);
//     canvas.drawRect(Rect.fromLTWH(0.0, 0.0, size.width, padH), paint);
//     final h = 0.1 * size.height;
//     canvas.drawArc(Rect.fromLTWH(0.0, -0.5 * h + padH, size.width, h), 0.0,
//         math.pi, false, paint);
//   }