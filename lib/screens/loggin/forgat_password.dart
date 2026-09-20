// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project_summer_team/compontes/item_filed.dart';

class ForgatPassword extends StatelessWidget {
  const ForgatPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('نسيت كلمه المرور', style: TextStyle(fontSize: 32)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemField(
              lable: '@mohsgdgchh ',
              icon: Icon(Icons.email),
              customText: 'البريد الالكتروني ',
              keyboardType: TextInputType.text,
              textEditingController: email,
            ),
            SizedBox(height: 30),
            Container(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () {},
                child: Text('ادخال ', style: TextStyle(color: Colors.white , fontSize: 28)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
