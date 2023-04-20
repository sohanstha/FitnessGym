import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_gymapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExerciseApp extends StatelessWidget {
  ExerciseApp({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()))),
          title: Text("Create Your Custom Exercise"),
          backgroundColor: Color(0xFF92A3FD),
        ),
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF92A3FD)))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: desController,
                  decoration: InputDecoration(
                      hintText: "Enter Your workout details",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide())),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF92A3FD),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Workout added Successfully", fontSize: 20);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                      CollectionReference collRef =
                          FirebaseFirestore.instance.collection('Workout');
                      collRef.add({
                        'name': titleController.text,
                        'details': desController.text,
                      });
                    },
                    child: const Text(
                      'Save',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
