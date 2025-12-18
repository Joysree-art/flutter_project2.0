import 'package:flutter/material.dart';
import 'package:flutterproject/home_page.dart';
import 'package:flutterproject/widgets/input_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String outputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Center(
        child: SizedBox(
          width: 360,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 30,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.blueGrey.shade100,
                      child: Icon(
                        Icons.person_add,
                        size: 40,
                        color: Colors.blueGrey.shade600,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Fill the form to register",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),

                    SizedBox(height: 25),

                    InputField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hint: "Your Name",
                      label: "Username",
                      icon: Icons.person_outline,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is Empty!!";
                        } else if (!RegExp(r'^[A-Za-z \.]+$').hasMatch(value)) {
                          return "Invalid Format";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15),

                    InputField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: "you@example.com",
                      label: "Email",
                      icon: Icons.email_outlined,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is Empty!!";
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                          return "Invalid Email";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15),

                    InputField(
                      controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      hint: "Password",
                      label: "Password",
                      icon: Icons.lock_outline,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is Empty!!";
                        } else if (value.length < 6) {
                          return "Minimum 6 characters";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15),

                    InputField(
                      controller: confirmPassController,
                      keyboardType: TextInputType.visiblePassword,
                      hint: "Confirm Password",
                      label: "Confirm Password",
                      icon: Icons.lock_outline,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is Empty!!";
                        } else if (value != passController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              outputText =
                                  "Name: ${nameController.text}\nEmail: ${emailController.text}";
                            }
                          });
                        },
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    if (outputText.isNotEmpty)
                      Text(
                        "Output:\n$outputText",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    SizedBox(height: 15),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text(
                        "Go to Homepage",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey.shade600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
