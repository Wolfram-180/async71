import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String surfLogoUrl =
    'https://raw.githubusercontent.com/Wolfram-180/apps_resources/main/surf_places/surflogo.png';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const _title = 'Async example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: _title),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: http.get(
            Uri.parse(surfLogoUrl),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Got error!');
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {}
            }

            return Container();
          },
        ),
      ),
    );
  }
}
