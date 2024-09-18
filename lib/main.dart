import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:status_saver/pages/images.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Status Saver'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.green[700]),
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          Images(),
          Text("data"),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.image), label: "Images"),
          NavigationDestination(
              icon: Icon(Icons.video_library), label: "Videos"),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Message New Number',
        child: const Icon(Icons.chat),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
