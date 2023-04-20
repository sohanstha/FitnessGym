import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:providerapp/controller/dataprovider.dart';

class UserDetail extends ChangeNotifier {
  // Instances for firestore and authentication
  final user = FirebaseAuth.instance.currentUser;
  final getUser = FirebaseFirestore.instance;

  // Text editing controller instances
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  // Declare variables
  String Name = "";
  String Age = "";
  String Height = "";
  String Weight = "";
  String Email = "";
  String Phone = "";
  String Password = "";

  // Getter methods
  String get getName => Name;
  String get getAge => Age;
  String get getHeight => Height;
  String get getWeight => Weight;
  String get getEmail => Email;
  String get getPhone => Phone;
  String get getPassword => Password;

  // Function to get user data from cloud firestore
  Future<void> getUserDetail() async {
    final uid1 = user!.uid;
    DocumentSnapshot snapshot =
        await getUser.collection('users').doc(uid1).get();

    if (snapshot == null || !snapshot.exists) {
      Fluttertoast.showToast(msg: "User didnot Exist");
    } else {
      var data1 = snapshot.data() as Map;

      Name = data1['Name'];
      Age = data1['Age'];
      Height = data1['Height'];
      Weight = data1['Weight'];
      Email = data1['Email'];
      Password = data1['Password'];
      Phone = data1['Mobile'];
    }
    notifyListeners();
  }

  // Function for updation user data
  Future<void> updateUser() async {
    final firestore = FirebaseFirestore.instance;
    final uid1 = user!.uid;

    if (uid1 != null) {
      firestore.collection('users').doc(uid1).set({
        "Name": nameController.text,
        "AGE": ageController.text,
        "Height": heightController.text,
        "Weight": weightController.text,
        "Mobile": mobileController.text,
        "Email": emailController.text,
        "Password": passController.text
      });
      await user!.updatePassword(passController.text);
      Fluttertoast.showToast(msg: "Updated Successfully");
    } else {
      Fluttertoast.showToast(msg: "User Not Found");
    }

    notifyListeners();
  }
}
