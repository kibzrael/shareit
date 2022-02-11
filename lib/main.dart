import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shareit/intro.dart';

void main() {
  runApp(const ShareIt());
}

class ShareIt extends StatelessWidget {
  const ShareIt({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'ShareIt',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme:
              InputDecorationTheme(fillColor: Colors.grey[300]),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          }),
          bottomAppBarColor: Colors.white,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.white),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 1,
            color: Colors.white,
            foregroundColor: Colors.black,
          )),
      home: const Intro(),
    );
  }
}
