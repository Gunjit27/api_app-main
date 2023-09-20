import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostDataScreen extends StatefulWidget {
  const PostDataScreen({Key? key});

  @override
  State<PostDataScreen> createState() => _PostDataScreenState();
}

class _PostDataScreenState extends State<PostDataScreen> {
  final url = "https://dummy.restapiexample.com/api/v1/create";

  Future<void> postData() async {
    try {
      final response = await post(
        Uri.parse("https://dummy.restapiexample.com/api/v1/create"),
        body: {"name": "test", "salary": "123", "age": "23"},
      );

      print(response.body);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
        backgroundColor: Colors.blue, 
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: ElevatedButton(
            onPressed: postData,
            child: Text("Send Post"),
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
