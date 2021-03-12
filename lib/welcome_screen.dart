import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/among_us/among_screen.dart';
import 'package:tec/popup_screen/about_app.dart';
import 'package:tec/popup_screen/crew_screen.dart';
import 'package:tec/popup_screen/rules_screen.dart';
import 'package:tec/pubg/pubg_screen.dart';
import 'package:tec/ludo/ludo_screen.dart';
import 'package:tec/main.dart';
import 'package:tec/messaging.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "main_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xffffe3de),
      Color(0xFFffdf91),
      Color(0xFF9dad7f),
      Color(0xFFfdffbc),
      Color(0xffffe3de)
    ],
  ).createShader(Rect.fromLTWH(200, 50.0, 200.0, 70.0));

  void updateKeys() async {
    SharedPreferences memberId = await SharedPreferences.getInstance();
    await notificationService.Initialise();
    final idList = memberId.getKeys();
    if (idList.isNotEmpty) {
      for (String id in idList) {
        MainScreen.ids.add(memberId.getString(id));
      }
    }
  }

  final NotificationService notificationService = NotificationService();
  @override
  void initState() {
    updateKeys();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white10,
        child: Text(
          'Vote for your Team / player',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Evil',
              letterSpacing: 1.5,
              color: Color(0xFFa3ddcb),
              fontSize: 20),
        ),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            elevation: 15,
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(
                  child: Text("Rules",
                      style: TextStyle(
                        fontFamily: 'Evil',
                        letterSpacing: 1.5,
                      )),
                  value: Rules.id),
              PopupMenuItem(
                  child: Text("Crew 2021",
                      style: TextStyle(
                        fontFamily: 'Evil',
                        letterSpacing: 1.5,
                      )),
                  value: Crew.id),
              PopupMenuItem(
                  child: Text("About US",
                      style: TextStyle(
                        fontFamily: 'Evil',
                        letterSpacing: 1.5,
                      )),
                  value: AboutApp.id),
            ],
            onSelected: (route) {
              Navigator.pushNamed(context, route);
            },
          ),
        ],
        title: Text(
          'Tronic ESport Championship',
          style: TextStyle(
              fontFamily: 'Evil', letterSpacing: 1.5, color: Color(0xFFa3ddcb)),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color(0xFF0A0D22), BlendMode.softLight),
                      image: AssetImage('images/all cover.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Flexible(
                  flex: 40,
                  child: Center(
                    child: Text(
                      "Game Titles",
                      style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(8.0, 8.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            Shadow(
                              offset: Offset(6.0, 4.0),
                              blurRadius: 8.0,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ],
                          foreground: Paint()..shader = linearGradient,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.overline,
                          fontSize: 49,
                          fontFamily: 'Evil',
                          letterSpacing: 8),
                    ),
                  ),
                ),
                Flexible(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      elevation: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.white.withOpacity(0.5),
                                BlendMode.dstATop),
                            image: AssetImage(
                              'images/pubgcard.jpg',
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50))),
                            onTap: () {
                              Navigator.pushNamed(context, PubgScreen.id);
                            },
                            title: Text(
                              'PUBG',
                              style: TextStyle(
                                  fontFamily: 'Evil',
                                  letterSpacing: 4,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFffe3de),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      elevation: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.white.withOpacity(0.5),
                                BlendMode.dstATop),
                            image: AssetImage(
                              'images/Ludoscreen.jpg',
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50))),
                            onTap: () {
                              Navigator.pushNamed(context, LudoScreen.id);
                            },
                            title: Text(
                              'LUDO',
                              style: TextStyle(
                                  fontFamily: 'Evil',
                                  letterSpacing: 4,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFffe3de),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      elevation: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.white.withOpacity(0.5),
                                BlendMode.dstATop),
                            image: AssetImage(
                              'images/Amongusscreen.jpg',
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50))),
                            onTap: () {
                              Navigator.pushNamed(context, AmongScreen.id);
                            },
                            title: Text(
                              'AMONG US',
                              style: TextStyle(
                                  fontFamily: 'Evil',
                                  letterSpacing: 4,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFffe3de),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
