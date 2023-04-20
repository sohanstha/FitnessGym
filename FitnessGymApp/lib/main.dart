import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_gymapp/controllers/auth.dart';
import 'package:fitness_gymapp/controllers/userdetail.dart';
import 'package:fitness_gymapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize the firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserDetail()),
    ChangeNotifierProvider(create: (_) => AuthServices()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp();

  AuthServices au = AuthServices();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
