import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String stringResponse = "";

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({Key? key}) : super(key: key);

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  Future<void> apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://dummy.restapiexample.com/api/v1/employees"));

    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
      });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Data"),
        backgroundColor: Colors.blue, 
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: Text(
            stringResponse.toString(),
            style: TextStyle(
              color: Colors.black, 
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GetDataScreen(),
    theme: ThemeData(
      primarySwatch: Colors.blue, 
    ),
  ));
}
