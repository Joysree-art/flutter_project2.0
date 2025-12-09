import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  TextEditingController controller = TextEditingController();
  String? errorText;
  double result = 0;

  void convert() {
    String value = controller.text;

    if (value.isEmpty) {
      errorText = "Please enter an amount!";
      result = 0;
    } else {
      errorText = null;
      result = double.tryParse(value)! * 121.64;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),

      body: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            elevation: 8,
            shadowColor: Colors.teal,
            color: Colors.teal.shade50,
            child: Padding(
              padding: const EdgeInsets.all(20.0),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // Title
                  const Text(
                    "USD → BDT Converter",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Direction Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("USD", style: TextStyle(fontSize: 20)),
                      SizedBox(width: 10),
                      Icon(Icons.swap_horiz, color: Colors.teal),
                      SizedBox(width: 10),
                      Text("BDT", style: TextStyle(fontSize: 20)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Input
                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.monetization_on),
                      labelText: "Enter USD Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      errorText: errorText,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Convert Button
                  ElevatedButton(
                    onPressed: convert,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      fixedSize: const Size(130, 40),
                    ),
                    child: const Text("Convert"),
                  ),

                  const SizedBox(height: 20),

                  // Result
                  Text(
                    "BDT ${result.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
