import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'student_list_page.dart';
import 'add_student_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ndlgmrluvfzsalnztaxp.supabase.co', // Replace with your Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5kbGdtcmx1dmZ6c2Fsbnp0YXhwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM1ODA3MTksImV4cCI6MjA0OTE1NjcxOX0.Q5JnzHWzimEmTHOXVUIftA42_T_rgh7l56radSfbwKc', // Replace with your Supabase anonymous key
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student CRUD App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AddStudentPage(),
    );
  }
}