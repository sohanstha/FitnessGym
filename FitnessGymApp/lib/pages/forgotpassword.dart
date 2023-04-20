import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_gymapp/pages/login_page.dart';
import 'package:fitness_gymapp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emails = TextEditingController();

  // function for recovering password
  forgotPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emails.text);
      Fluttertoast.showToast(
          msg: "Link has been sent to this email to reset your password");
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(), gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF92A3FD),
        title: const Text('Reset your Password'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [secondary, primary])),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: emails,
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          hintText: "Enter Email Address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Color(0xFF92A3FD)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 35.0,
                  ),

                  // Elevated Button
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF92A3FD),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        // Check whether the text field left blank or not
                        if (_formKey.currentState!.validate()) {
                          // check the email validation and store boolean result
                          bool isValid = EmailValidator.validate(emails.text);

                          // Check whether the email valid or not
                          // if valid then route to diffrent page
                          if (isValid) {
                            forgotPassword();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Invalid email address entered");
                          }
                        }
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
