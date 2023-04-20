import 'package:fitness_gymapp/controllers/userdetail.dart';
import 'package:fitness_gymapp/pages/drawerscreen.dart';
import 'package:fitness_gymapp/pages/home_page.dart';
import 'package:fitness_gymapp/pages/root_app.dart';
import 'package:fitness_gymapp/pages/update_profile.dart';
import 'package:fitness_gymapp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postModel = Provider.of<UserDetail>(context, listen: false);
    postModel.getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF92A3FD),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RootApp()))),
          title: Text("User Profile"),
          centerTitle: true,
        ),
        body: Consumer<UserDetail>(
          builder: (context, value, child) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [secondary, primary])),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                        child: CircleAvatar(
                          radius: 70,
                          child: Text(
                            (value.getName.isNotEmpty)
                                ? value.getName[0].toUpperCase()
                                : "",
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),

                      // Name
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 12, bottom: 10),
                        child: Container(
                          child: Row(
                            children: [
                              const Text("Name:",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(value.getName,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Email
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 12, bottom: 10),
                        child: Container(
                          child: Row(
                            children: [
                              const Text("Email:",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(value.getEmail,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Phone Number
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 12, bottom: 10),
                        child: Container(
                          child: Row(
                            children: [
                              const Text("Phone:",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(value.getPhone,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 20, top: 12, bottom: 10),
                      //   child: Container(
                      //     child: Row(
                      //       children: [
                      //         const Text("Age:",
                      //             style: TextStyle(
                      //                 fontSize: 25,
                      //                 fontWeight: FontWeight.bold)),
                      //         Padding(
                      //           padding: const EdgeInsets.only(left: 10),
                      //           child: Text(value.getAge,
                      //               style: TextStyle(
                      //                   fontSize: 22,
                      //                   fontWeight: FontWeight.bold)),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 20, top: 12, bottom: 10),
                      //   child: Container(
                      //     child: Row(
                      //       children: [
                      //         const Text("Height:",
                      //             style: TextStyle(
                      //                 fontSize: 25,
                      //                 fontWeight: FontWeight.bold)),
                      //         Padding(
                      //           padding: const EdgeInsets.only(left: 10),
                      //           child: Text(value.getHeight,
                      //               style: TextStyle(
                      //                   fontSize: 22,
                      //                   fontWeight: FontWeight.bold)),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 20, top: 12, bottom: 10),
                      //   child: Container(
                      //     child: Row(
                      //       children: [
                      //         const Text("Weight:",
                      //             style: TextStyle(
                      //                 fontSize: 25,
                      //                 fontWeight: FontWeight.bold)),
                      //         Padding(
                      //           padding: const EdgeInsets.only(left: 10),
                      //           child: Text(value.getWeight,
                      //               style: TextStyle(
                      //                   fontSize: 22,
                      //                   fontWeight: FontWeight.bold)),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: 33,
                      ),

                      // Edit profile button
                      SizedBox(
                        height: 60,
                        width: 360,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF92A3FD),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateMyProfile()));
                          },
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
