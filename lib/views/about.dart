





import 'package:flutter/material.dart';
import 'package:untitled11/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      body: body(context),
    );
  }

  Widget appBarComponent(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
          child: Row(
            children: <Widget>[
              Container(
                width: 90,
                height: 80,
                padding: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  gradient: BLUE_GRADIENT,
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: WHITE_COLOR,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          )),
    );
  }

  Widget body(context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: ListView(
        children: <Widget>[
          headerComponent(),
          Container(margin: EdgeInsets.only(top: 40)),
          descriptionComponent(),
          Container(margin: EdgeInsets.only(top: 40)),
          codeSourceComponent(),
          Container(margin: EdgeInsets.only(top: 20)),
          Divider(),
          Container(margin: EdgeInsets.only(top: 40)),
          developerItemComponent(
            "Front-end and Back-end developer",
            "Sandeep Raju",
            github: "https://github.com/sandeepraju124",
            linkedIn: "https://www.linkedin.com/in/sandeep-raju-7a17521b5/",
          ),
          Container(margin: EdgeInsets.only(top: 30)),
          // developerItemComponent(
          //   "Designer",
          //   "Roshan G Rahman",
          //   github: "",
          //   linkedIn: "",
          // )
        ],
      ),
    );
  }

  Widget headerComponent() {
    return Text("About app", style: TextStyle(fontSize: 36));
  }

  Widget descriptionComponent() {
    return Text(
      "It’s a fully functioning chat application built using flutter and "
          "uses Firebase and Stream for sending & receiving real time data",
      style: TextStyle(
        fontSize: 19,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget codeSourceComponent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Code for the app',
          style: TextStyle(fontSize: 18),
        ),
        // ignore: deprecated_member_use
        OutlineButton.icon(
          icon: Icon(Icons.link),
          label: Text("Github"),
          onPressed: () {
            launchURL("https://github.com/sandeepraju124");
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
      ],
    );
  }

  Widget developerItemComponent(
      String role,
      String name, {
        String linkedIn,
        String github,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          role,
          style: TextStyle(fontSize: 18),
        ),
        Container(margin: EdgeInsets.only(top: 5)),
        Row(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontSize: 24, color: PALE_ORANGE),
            ),
            Expanded(child: Container()),
            IconButton(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/linkedin.png",
                  width: 26,
                  height: 26,
                ),
              ),
              onPressed: () => launchURL(linkedIn),
            ),
            Container(margin: EdgeInsets.only(left: 5)),
            IconButton(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/git.png",
                  width: 26,
                  height: 26,
                ),
              ),
              onPressed: () async {
                await launchURL(github);
              },
            )
          ],
        )
      ],
    );
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
