import 'package:email_validator/email_validator.dart';
import 'package:fitness_gymapp/controllers/auth.dart';
import 'package:fitness_gymapp/pages/register.dart';
import 'package:fitness_gymapp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitness_gymapp/pages/forgotpass.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/google_signin_service.dart';

// import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  // Variable declaration for remember me
  bool isRememberMe = false;

  // Variable declaration for password visible or invisible
  late bool _passwordVisible;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Obejct of auth class
  AuthServices au = AuthServices();

  // GoogleService gs = GoogleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                height: (size.height - 60) * 0.5,
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "For Aesthetics",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: bgTextField,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.envelope,
                              color: black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: TextField(
                                controller: au.logEmails,
                                cursorColor: black.withOpacity(0.5),
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: bgTextField,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.lock,
                              color: black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: TextField(
                                cursorColor: black.withOpacity(0.5),
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return "Required this field";
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                LineIcons.eyeAlt,
                                color: black.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => forgotpass()),
                        );
                      },
                      child: Text(
                        "Forgot your password ?",
                        style: TextStyle(
                            fontSize: 14, decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registration()),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 14, decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              // login button and social login
              Container(
                  height: (size.height - 60) * 0.5,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            bool isValid =
                                EmailValidator.validate(au.logEmails.text);
                            if (isValid) {
                              au.loginUser(context);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Invalid Email",
                                  gravity: ToastGravity.CENTER,
                                  textColor: Colors.redAccent,
                                  fontSize: 20.0);
                            }
                          }
                        },
                        // onTap: () {
                        //   Navigator.pushNamedAndRemoveUntil(
                        //       context, "/root_app", (route) => false);
                        // },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: [secondary, primary]),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Divider(
                              thickness: 0.8,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Or"),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Divider(
                              thickness: 0.8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: black.withOpacity(0.1))),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/google_icon.svg",
                                width: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}