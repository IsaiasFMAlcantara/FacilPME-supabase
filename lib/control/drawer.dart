import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:facilpme/model/drawer.dart';

class ControllerDrawer {
  final List<DrawerItem> drawerItems = [
    DrawerItem(icon: Icons.home, title: 'Home', route: '/home'),
    DrawerItem(icon: Icons.shopping_cart, title: 'Vendas', route: '/vendas'),
    DrawerItem(icon: Icons.account_box, title: 'Contatos', route: '/contatos'),
    DrawerItem(
        icon: Icons.shopping_basket, title: 'Compras', route: '/compras'),
    DrawerItem(icon: Icons.storage, title: 'Estoque', route: '/estoque'),
    DrawerItem(
        icon: Icons.receipt_long_sharp, title: 'Despesas', route: '/despesas'),
    DrawerItem(icon: Icons.add, title: 'Produtos', route: '/produtos'),
    DrawerItem(
        icon: Icons.description, title: 'Relatórios', route: '/relatorios'),
  ];

  void navigateTo(String route) {
    Get.toNamed(route);
  }
}