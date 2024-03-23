import 'package:facilpme/utils/views.dart';
import 'package:facilpme/view/pageuser/forgotpassword.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> CustomGetPages = [
  GetPage(name: '/homescreen', page: () => HomeScreen()),
  GetPage(name: '/pagestart', page: () => PageUser()),
  GetPage(name: '/esqueci_senha', page: () => RecSenha())
];
