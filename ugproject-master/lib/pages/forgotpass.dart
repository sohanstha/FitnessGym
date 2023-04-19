import 'package:flutter/material.dart';

class forgotpass extends StatelessWidget {
  const forgotpass({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://image.shutterstock.com/image-vector/icon-concept-about-forgot-password-260nw-1909912900.jpg'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
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
                      Icons.person,
                      color: Color(0xFF92A3FD),
                    ),
                    prefixIconColor: Color(0xFF92A3FD),
                    fillColor: Colors.white10,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Reset',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF92A3FD)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
