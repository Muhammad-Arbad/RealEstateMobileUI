
import 'package:coding_chellange/views/Dashboard.dart';
import 'package:coding_chellange/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarBrightness: Brightness.dark,
  //   statusBarColor: Colors.black,
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3ab4bc)),
        useMaterial3: true,
      ),

      home: const SplashScreen(),
    );
  }
}




