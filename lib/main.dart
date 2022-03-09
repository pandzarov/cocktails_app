import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loka_app/constants.dart';
import 'package:loka_app/ui_windows/search.window.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyCocktail()));
}

class MyCocktail extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchWindow(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
    );
  }
}
