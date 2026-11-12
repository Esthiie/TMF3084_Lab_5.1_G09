import 'package:flutter/material.dart';
import '../models/student.dart';
import 'studentdetails.dart';

final List<Student> studentData = [
  Student(
    name: 'Daiyanti anak Juit',
    studentId: '103756',
    programme: 'Software Engineering',
  ),
  Student(
    name: 'Estherne Liow Ker Yin',
    studentId: '104062',
    programme: 'Software Engineering',
  ),
  Student(
    name: 'Norasyikin Amirah Huda',
    studentId: '105436',
    programme: 'Software Engineering',
  ),
  Student(
    name: 'Reselda anak Robie',
    studentId: '106131',
    programme: 'Software Engineering',
  ),
  Student(
    name: 'Vanessa Fedillia anak Mathew',
    studentId: '106615',
    programme: 'Software Engineering',
  ),
];

class StudentInformationPage extends StatelessWidget {
  const StudentInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: studentData.length,
      itemBuilder: (context, index) {
        final student = studentData[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFDCEBFF),
              child: Text(
                student.name[0],
                style: const TextStyle(
                  color: Color(0xFF1479E8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              student.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Student ID: ${student.studentId}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StudentDetailsPage(student: student),
                ),
              );
            },
          ),
        );
      },
    );
  }
}