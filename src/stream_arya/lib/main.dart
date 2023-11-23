import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Arya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StreamHomepage(),
    );
  }
}

class StreamHomepage extends StatefulWidget {
  const StreamHomepage({super.key});

  @override
  State<StreamHomepage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamHomepage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
