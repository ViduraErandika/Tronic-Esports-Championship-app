import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class AboutApp extends StatelessWidget {
  static const String id = "about_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0D22),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(7),
        color: Colors.white10,
        child: Text(
          'Thank you for the Support !\nRate the App for further developments.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Evil',
              letterSpacing: 1.5,
              color: Color(0xFFa3ddcb),
              fontSize: 13),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 41,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Color(0xFF0A0D22),
                  child: Image(image: AssetImage("images/logo.png")),
                  radius: 125,
                ),
              ),
            ),
            Flexible(
              flex: 35,
              child: Text(
                "Tronic ESport \n Championship \n 2021",
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 4,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Evil',
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Flexible(
              flex: 12,
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  fontSize: 15,
                  color: Colors.teal.shade100,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 150,
              child: Divider(
                color: Colors.teal.shade50,
              ),
            ),
            Flexible(
              flex: 5,
              child: Text(
                "Made by ENTC",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                  fontSize: 24,
                  color: Colors.teal.shade100,
                  fontFamily: 'Evil',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
              flex: 5,
              child: Text(
                "in",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                  fontSize: 24,
                  color: Colors.teal.shade100,
                  fontFamily: 'Evil',
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "V",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      fontSize: 50,
                      color: Colors.teal.shade100,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                Text(
                  "Labs",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    fontSize: 25,
                    color: Colors.teal.shade100,
                    fontFamily: 'Lobster',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
