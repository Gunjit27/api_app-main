import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteDataScreen extends StatefulWidget {
  const DeleteDataScreen({Key? key}) : super(key: key);

  @override
  _DeleteDataScreenState createState() => _DeleteDataScreenState();
}

class _DeleteDataScreenState extends State<DeleteDataScreen> {
  void deleteData() async {
    final url = Uri.parse('https://dummy.restapiexample.com/api/v1/delete/2/');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Data deleted successfully'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to delete data. Status code: ${response.statusCode}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error occurred while deleting data: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Data"),
        backgroundColor: Colors.blue, // Change the app bar color
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: ElevatedButton(
            onPressed: deleteData,
            child: Text("Delete Data"),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Change the button color
              onPrimary: Colors.white, // Change the text color
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DeleteDataScreen(),
    theme: ThemeData(
      primarySwatch: Colors.blue, // Change the primary color theme
    ),
  ));
}
