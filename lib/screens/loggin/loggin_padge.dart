// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project_summer_team/screens/home_padge.dart';
import 'package:project_summer_team/screens/loggin/forgat_password.dart';
import 'package:project_summer_team/screens/loggin/sign_up.dart';
import 'package:project_summer_team/compontes/user_modal.dart';

class Loggin extends StatefulWidget {
  const Loggin({super.key});

  @override
  State<Loggin> createState() => _LogginState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
int tryPassword = 0;

class _LogginState extends State<Loggin> {
  bool remmber = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset('assets/images/app_bar.jpg', height: 90),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                'مرحبا بك مجددا !',

                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(' البيرد الالكتروني *', style: TextStyle(fontSize: 22)),
              TextField(
                controller: emailController,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF3F4F6),
                  hintText: ' البريد Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('كلمه المرور', style: TextStyle(fontSize: 22)),
              TextField(
                controller: passwordController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF3F4F6),
                  hintText: 'كلمه المرور',
                  suffixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ForgatPassword();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'نسيت كلمه المرور؟',
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    ),
                  ),

                  Row(
                    children: [
                      Text('تذكرني', style: TextStyle(fontSize: 20)),
                      Checkbox(
                        activeColor: Colors.blue,
                        value: remmber,
                        onChanged: (bool? newValue) {
                          setState(() {
                            remmber = newValue ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 35),
              Container(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('برجاء اخال جميع البينات'),
                          );
                        },
                      );
                    } else {
                      User? foundUser;
                      for (var user in UserData.userList) {
                        String email = emailController.text.trim();

                        if (user.email == email) {
                          foundUser = user;
                          break;
                        }
                      }
                      if (foundUser != null) {
                        String password = passwordController.text.trim();
                        if (foundUser.password == password) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                          setState(() {
                            emailController.clear();
                            passwordController.clear();
                          });
                        } else if (tryPassword < 3) {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('كلمه مرور غير صحيحه '),
                              );
                            },
                          );
                          tryPassword++;
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgatPassword();
                              },
                            ),
                          );
                        }
                      } else {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('بريد الكتروني غير صحيح'),
                            );
                          },
                        );
                      }
                    }
                  },
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    Text('ليس لديك حساب ؟', style: TextStyle(fontSize: 17)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'انشاء حساب جديد',
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
