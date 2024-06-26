import 'package:flutter/material.dart';
import 'package:myapp/pages/loginpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
