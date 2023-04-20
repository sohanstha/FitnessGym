import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_gymapp/firebase_options.dart';
import 'package:fitness_gymapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;

void main() async {
  // Initialize the firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    onGenerateRoute: router.generateRoute,
  ));
}
