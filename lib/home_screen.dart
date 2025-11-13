import 'package:flutter/material.dart';
import 'package:flutterproject/about_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter Home"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      drawer: NavigationDrawer(
        children: [
          const DrawerHeader(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              accountName: Text("Student Name"),
              accountEmail: Text("student@email.com"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About Page"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {},
        tooltip: "Add Something",
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Welcome to My Flutter App!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              const SizedBox(height: 20),

              // Row of buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      fixedSize: const Size(130, 40),
                    ),
                    child: const Text("Click Me"),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("Outlined"),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.teal.shade200,
                        foregroundColor: Colors.white),
                    child: const Text("Text Btn"),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Container example
              Container(
                width: 320,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.teal, width: 2),
                ),
                child: const Text(
                  "This is a decorated container",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),

              const SizedBox(height: 30),

              // Card example
              SizedBox(
                height: 180,
                width: 300,
                child: Card(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "Flutter Card Widget",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text("You can show small info or content here."),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Learn More"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Image asset
              Image.asset(
                'assets/images/flutter.png',
                height: 100,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
