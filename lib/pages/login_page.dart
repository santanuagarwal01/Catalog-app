import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 500));
      await Navigator.pushNamed(
        context,
        MyRoutes.homeRoute,
      );
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        label: Text("Username"),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        label: Text("Password"),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length cannot be less than 6";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          height: 45,
                          width: changeButton ? 45 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                          duration: Duration(milliseconds: 500),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       MyRoutes.homeRoute,
                    //     );
                    //   },
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 40),
                    //   ),
                    // ),
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
