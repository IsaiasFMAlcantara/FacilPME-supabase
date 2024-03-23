import 'package:flutter/material.dart';
import 'package:facilpme/utils/views.dart';

class PageUser extends StatefulWidget {
  const PageUser({Key? key}) : super(key: key);

  @override
  State<PageUser> createState() => _PageUserState();
}

class _PageUserState extends State<PageUser>
    with SingleTickerProviderStateMixin {
  late TabController tabBarController;

  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FacilPME'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Color(0xFF101213),
            unselectedLabelColor: Color(0xFF57636C),
            labelPadding: EdgeInsets.all(10),
            indicatorColor: Color(0xFF4B39EF),
            indicatorWeight: 4,
            tabs: [
              Tab(
                text: 'Sign In',
              ),
              Tab(
                text: 'Sign Up',
              ),
            ],
            controller: tabBarController,
          ),
          Expanded(
            child: TabBarView(
              controller: tabBarController,
              children: [
                Padding(
                  padding: EdgeInsets.all(25),
                  child: LoginUser(),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: CreateUser(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}