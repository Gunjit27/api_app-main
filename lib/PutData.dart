import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PutDataScreen extends StatefulWidget {
  const PutDataScreen({Key? key});

  @override
  State<PutDataScreen> createState() => _PutDataScreenState();
}

class _PutDataScreenState extends State<PutDataScreen> {
  final url = "https://dummy.restapiexample.com/api/v1/update/21/";

  Future<void> putData() async {
    try {
      final response = await put(
        Uri.parse("https://dummy.restapiexample.com/api/v1/update/21/"),
        body: {
          "name": "test",
          "salary": "123",
          "age": "23",
        },
      );

      print(response.body);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: Text("Put Data"),
        backgroundColor: Colors.blue, 
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: ElevatedButton(
            onPressed: putData,
            child: Text("Put Data"),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, 
              onPrimary: Colors.white, 
            ),
          ),
        ),
      ),
    );
  }
}
