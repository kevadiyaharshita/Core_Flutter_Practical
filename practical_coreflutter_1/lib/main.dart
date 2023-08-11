import 'package:flutter/material.dart';
import 'package:practical_coreflutter_1/utils/MyRoutes.dart';
import 'package:practical_coreflutter_1/utils/color_utils.dart';
import 'package:practical_coreflutter_1/views/screens/Home_Page.dart';
import 'package:practical_coreflutter_1/views/screens/Splash_Screen.dart';
import 'package:practical_coreflutter_1/views/screens/pdf_Page.dart';
import 'package:practical_coreflutter_1/views/screens/to_do_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: theme_1),
        initialRoute: MyRoutes.Splash_Screen,
        routes: {
          MyRoutes.home: (context) => const HomePage(),
          MyRoutes.to_do_page: (context) => const to_do_page(),
          MyRoutes.Splash_Screen: (context) => const Splash_Screen(),
          MyRoutes.pdf_Page: (context) => const pdf_Page(),
        });
  }
}
