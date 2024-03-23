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
      //initialRoute: FirebaseAuth.instance.currentUser != null ? '/pagemenu' : '/areausuario',
      initialRoute: '/pagestart',
      theme: Facilpme.theme,
      darkTheme: Facilpme.darkTheme,
      getPages: CustomGetPages,
    );
  }
}
