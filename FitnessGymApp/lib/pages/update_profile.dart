import 'package:fitness_gymapp/controllers/userdetail.dart';
import 'package:fitness_gymapp/pages/viewprofile.dart';
import 'package:fitness_gymapp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateMyProfile extends StatefulWidget {
  const UpdateMyProfile({Key? key}) : super(key: key);

  @override
  State<UpdateMyProfile> createState() => _UpdateMyProfileState();
}

class _UpdateMyProfileState extends State<UpdateMyProfile> {
  final _formKey = GlobalKey<FormState>();

  // Variable declaration for password visible or invisible
  late bool _passwordVisible;
  UserDetail ud = UserDetail();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postModel = Provider.of<UserDetail>(context, listen: false);
    postModel.getUserDetail();
    ud.nameController.text = postModel.getName;
    ud.ageController.text = postModel.getAge;
    ud.heightController.text = postModel.getHeight;
    ud.weightController.text = postModel.getWeight;
    ud.mobileController.text = postModel.getPhone;
    ud.emailController.text = postModel.getEmail;
    ud.passController.text = postModel.getPassword;
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<UserDetail>(context, listen: false);
    postModel.getUserDetail();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyProfile()))),
        centerTitle: true,
        title: const Text("Update Profile"),
        backgroundColor: Color(0xFF92A3FD),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [secondary, primary])),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30, left: 20.0, right: 20, bottom: 20),
            child: Column(
              children: [
                // Username
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: TextFormField(
                      controller: ud.nameController,
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          label: Text("Name"),
                          hintText: "Enter Your Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(),
                          )),
                    ),
                  ),
                ),

                // Age
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: ud.ageController,
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          label: Text("AGE"),
                          hintText: "Enter Your AGE",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide())),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: ud.heightController,
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          label: Text("Height"),
                          hintText: "Enter Your Height",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide())),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: ud.weightController,
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          label: Text("Weight"),
                          hintText: "Enter Your Weight",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide())),
                    ),
                  ),
                ),

                // Mobile Number
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: TextFormField(
                      controller: ud.mobileController,
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          label: Text("Phone"),
                          hintText: "Enter Phone Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFF92A3FD)))),
                    ),
                  ),
                ),

                // Password
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      controller: ud.passController,
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          label: Text("Password"),
                          hintText: "Enter Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFF92A3FD)))),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15.0,
                ),

                // Elevated Button
                Container(
                  child: SizedBox(
                    height: 60,
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF92A3FD),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        ud.updateUser();
                        dispose();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfile()));
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
