import 'package:advertech_task/ui/contact_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

///Main widget class
class MyApp extends StatelessWidget {
  ///Widget constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advertech task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      home: const ContactPage(),
    );
  }
}
