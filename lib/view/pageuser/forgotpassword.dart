import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:facilpme/utils/views.dart';

class RecSenha extends StatefulWidget {
  const RecSenha({super.key});

  @override
  State<RecSenha> createState() => _RecSenhaState();
}

class _RecSenhaState extends State<RecSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Reset instructions will be sent to your school email address associated with your account',
                textAlign: TextAlign.justify,
              ),
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 40,
            ),
            RecuperarSenha(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Remembered the password?'),
          GestureDetector(
            onTap: () {
              Get.offNamed('/pagestart');
            },
            child: Text(
              ' Return to login page',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}