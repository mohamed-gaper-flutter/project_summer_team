// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project_summer_team/compontes/item_filed.dart';
import 'package:project_summer_team/compontes/user_modal.dart';
import 'package:project_summer_team/screens/view_padge.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('انشاء حساب جديد', style: TextStyle(fontSize: 32)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ItemField(
                lable: 'محمد احمد',
                icon: Icon(Icons.person),
                customText: 'الاسم بالكامل',
                keyboardType: TextInputType.text,
                textEditingController: fullName,
              ),
              ItemField(
                lable: '@mohsgdgchh ',
                icon: Icon(Icons.email),
                customText: 'البريد الالكتروني ',
                keyboardType: TextInputType.text,
                textEditingController: email,
              ),
              ItemField(
                lable: ' 01200000000',
                icon: Icon(Icons.phone),
                customText: 'رقم الهاتف',
                keyboardType: TextInputType.number,
                textEditingController: phoneNumber,
              ),
              ItemField(
                lable: '********  ',
                icon: Icon(Icons.password),
                customText: 'كلمه المرور',
                keyboardType: TextInputType.text,
                textEditingController: password,
              ),
              SizedBox(height: 20),
              Container(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (fullName.text.isEmpty ||
                        email.text.isEmpty ||
                        phoneNumber.text.isEmpty ||
                        password.text.isEmpty) {
                      setState(() {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('برجاء اخال جميع البينات'),
                            );
                          },
                        );
                      });
                    } else {
                      User newUser = User(
                        fullName: fullName.text,
                        email: email.text,
                        password: password.text,
                        phoneNumber: phoneNumber.text,
                      );
                      UserData.userList.add(newUser);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OffersPage();
                          },
                        ),
                      );
                      password.clear();
                      phoneNumber.clear();
                      email.clear();
                      fullName.clear();
                    }
                  },
                  child: Text(
                    'انشاء حساب',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    setState(() {
                      password.clear();
                      phoneNumber.clear();
                      email.clear();
                      fullName.clear();
                    });
                  },
                  child: Text(
                    'حذف',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
