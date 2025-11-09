import 'package:flutter/material.dart';

import 'screens/exam_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const ExamListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
