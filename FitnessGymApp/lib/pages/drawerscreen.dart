// ignore_for_file: unused_local_variable

import 'package:fitness_gymapp/controllers/auth.dart';
import 'package:fitness_gymapp/controllers/userdetail.dart';
import 'package:fitness_gymapp/pages/login_page.dart';
import 'package:fitness_gymapp/pages/viewprofile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  AuthServices au = AuthServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final postModel = Provider.of<UserDetail>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<UserDetail>(context, listen: false);

    return Scaffold(
      body: Consumer<UserDetail>(builder: (context, value, child) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF92A3FD)),
                accountName: Text(
                  value.getName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  value.getEmail,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 52,
                    child: Text(
                      (value.getName.isNotEmpty)
                          ? value.getName[0].toUpperCase()
                          : "",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.people,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, color: Color(0xFF92A3FD)),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyProfile()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text(
                  'logout',
                  style: TextStyle(fontSize: 20, color: Color(0xFF92A3FD)),
                ),
                onTap: () {
                  au.logoutUser();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
