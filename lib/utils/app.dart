import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FacilPME',
      debugShowCheckedModeBanner: false,
      //initialRoute: '/pagestart',
      initialRoute: '/homescreen',
      theme: Facilpme.theme,
      darkTheme: Facilpme.darkTheme,
      getPages: CustomGetPages,
    );
  }
}
