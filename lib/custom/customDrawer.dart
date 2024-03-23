import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:facilpme/control/drawer.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  final ControllerDrawer controller = Get.put(ControllerDrawer());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ...ListTile.divideTiles(
            context: context,
            tiles: controller.drawerItems.map((item) {
              return Card(
                child: ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.title),
                  onTap: () => controller.navigateTo(item.route),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}