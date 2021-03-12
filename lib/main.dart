import 'package:flutter/material.dart';
import 'package:tec/welcome_screen.dart';
import 'package:tec/among_us/among_screen.dart';
import 'package:tec/ludo/ludo_screen.dart';
import 'package:tec/pubg/pubg_screen.dart';
import 'package:tec/popup_screen/about_app.dart';
import 'package:tec/popup_screen/rules_screen.dart';
import 'package:tec/popup_screen/crew_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  static List ids = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        Rules.id: (context) => Rules(),
        AboutApp.id: (context) => AboutApp(),
        Crew.id: (context) => Crew(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        PubgScreen.id: (context) => PubgScreen(),
        LudoScreen.id: (context) => LudoScreen(),
        AmongScreen.id: (context) => AmongScreen(),
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        appBarTheme: AppBarTheme(
          color: Color(0xFF111328),
        ),
      ),
    );
  }
}
