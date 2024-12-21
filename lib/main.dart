import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final dio = Dio();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder(
              future: getEtudiants(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Nom"),
                    subtitle: Text("2000"),
                  );
                });
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  getEtudiants() async {
    var headers = {
      'apikey':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtuYXFxcW93aGdqaGpxcWJvZnV5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ3NzgwODgsImV4cCI6MjA1MDM1NDA4OH0.e11pn6xZF-Qx-o8pG9g8AzoGr-vG6rhvVPR2ay9T5fg',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtuYXFxcW93aGdqaGpxcWJvZnV5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ3NzgwODgsImV4cCI6MjA1MDM1NDA4OH0.e11pn6xZF-Qx-o8pG9g8AzoGr-vG6rhvVPR2ay9T5fg'
    };
    var dio = Dio();
    return await dio.request(
      'https://knaqqqowhgjhjqqbofuy.supabase.co/rest/v1//etudiant',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
  }
}
