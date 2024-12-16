import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateStudentPage extends StatefulWidget {
  final Map<String, dynamic> student;

  const UpdateStudentPage({required this.student});

  @override
  _UpdateStudentPageState createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  final SupabaseClient _supabase = Supabase.instance.client;
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _lastNameController;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.student['first_name']);
    _middleNameController =
        TextEditingController(text: widget.student['middle_name']);
    _lastNameController =
        TextEditingController(text: widget.student['last_name']);
  }

  Future<void> _updateStudent() async {
    try {
      await _supabase.from('students').update({
        'first_name': _firstNameController.text,
        'middle_name': _middleNameController.text,
        'last_name': _lastNameController.text,
      }).eq('student_id', widget.student['student_id']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student updated successfully')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update student: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _middleNameController,
              decoration: InputDecoration(labelText: 'Middle Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateStudent,
              child: Text('Update Student'),
            ),
          ],
        ),
      ),
    );
  }
}
