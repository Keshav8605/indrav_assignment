import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indrav_assignment/view/screens/homeScreen.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final formkey = GlobalKey<FormState>();

  String useremail = "";
  String userpassword = "";

  void submit_form() {
    bool isvalid = formkey.currentState!.validate();
    if (isvalid) {
      formkey.currentState!.save();
      Get.to(home_screen());
    } else {
      print("ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff4C50E3), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login, to get started!",
                  style: TextStyle(
                      fontSize: size / 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                SizedBox(
                  height: size / 35,
                ),
                Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("enter email"),
                        SizedBox(
                          height: size / 35,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(size / 25),
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                              hintText: "Enter email",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size / 25))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              useremail = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: size / 35,
                        ),
                        Text("enter password"),
                        SizedBox(
                          height: size / 35,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(size / 25),
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                              hintText: "Enter password (minimum 8 characters)",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size / 25))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.toString().length < 8) {
                              return "Password must be 8 characters long";
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              userpassword = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: size / 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                submit_form();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurpleAccent),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
