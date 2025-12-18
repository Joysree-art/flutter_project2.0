import 'package:flutter/material.dart';
import 'package:flutterproject/home_page.dart';
import 'package:flutterproject/widgets/input_field.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  TextEditingController textController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade300,
        elevation: 0,
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
                    // Top Icon
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.blueGrey.shade100,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.blueGrey.shade600,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Login to your account",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),

                    SizedBox(height: 30),

                    InputField(
                      controller: textController,
                      keyboardType: TextInputType.text,
                      hint: "Your name",
                      label: "Username",
                      icon: Icons.person_outline,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is Empty!!";
                        } else if (!RegExp(r'^[A-Za-z \.]+$')
                            .hasMatch(value)) {
                          return "Invalid Format";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 18),

                    InputField(
                      controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      hint: "Your password",
                      label: "Password",
                      icon: Icons.lock_outline,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is Empty!!";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 30),

                    // Login Button
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
                              text = textController.text;
                            }
                          });
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Output
                    if (text.isNotEmpty)
                      Text(
                        "Output: $text",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey.shade700,
                        ),
                      ),

                    SizedBox(height: 15),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
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
