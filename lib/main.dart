import 'package:flutter/material.dart';
import 'GetData.dart';
import 'PostData.dart';
import 'PutData.dart';
import 'DeleteData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue, 
        scaffoldBackgroundColor: Colors.blueAccent, 
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    GetDataScreen(),
    PostDataScreen(),
    PutDataScreen(),
    DeleteDataScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Working API app"),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.get_app),
            label: 'Get',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Put',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Delete',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.blue, 
        onTap: _onItemTapped,
        backgroundColor: Colors.blue, 
      ),
    );
  }
}
