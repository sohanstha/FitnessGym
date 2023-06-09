import 'package:email_validator/email_validator.dart';
import 'package:fitness_gymapp/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Register Account';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF92A3FD),
          title: Text(appTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Form widget.
class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  AuthServices au = AuthServices();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              TextFormField(
                controller: au.nameController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF92A3FD)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF92A3FD),
                    ),
                    //borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Color(0xFF92A3FD), //<-- SEE HERE
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF92A3FD),
                  ),
                  prefixIconColor: Color(0xFF92A3FD),
                  fillColor: Colors.white10,
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: au.mobileController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF92A3FD)),

                    //borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF92A3FD),
                    ),
                    //borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your phone number',
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                    color: Color(0xFF92A3FD),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF92A3FD),
                  ),
                  prefixIconColor: Color(0xFF92A3FD),
                  fillColor: Colors.white10,
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: au.emailController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF92A3FD)),

                    //borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF92A3FD),
                    ),
                    //borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your email Id',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color(0xFF92A3FD), //<-- SEE HERE
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF92A3FD),
                  ),
                  prefixIconColor: Color(0xFF92A3FD),
                  fillColor: Colors.white10,
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: au.passController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF92A3FD)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF92A3FD),
                    ),
                  ),
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xFF92A3FD), //<-- SEE HERE
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Color(0xFF92A3FD),
                  ),
                  prefixIconColor: Color(0xFF92A3FD),
                  fillColor: Colors.white10,
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: au.confirmPassController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF92A3FD)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF92A3FD),
                    ),
                  ),
                  hintText: 'Enter your password',
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Color(0xFF92A3FD), //<-- SEE HERE
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Color(0xFF92A3FD),
                  ),
                  prefixIconColor: Color(0xFF92A3FD),
                  fillColor: Colors.white10,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.only(left: 110.0, top: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        bool isValid =
                            EmailValidator.validate(au.emailController.text);

                        if (au.passController.text ==
                            au.confirmPassController.text) {
                          au.newAccount(context);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Password didnot match",
                              gravity: ToastGravity.CENTER,
                              textColor: Colors.redAccent,
                              fontSize: 20.0);
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Invalid Email",
                            gravity: ToastGravity.CENTER,
                            textColor: Colors.redAccent,
                            fontSize: 20.0);
                      }
                    },
                    child: const Text('Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF92A3FD)),
                    ),
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
