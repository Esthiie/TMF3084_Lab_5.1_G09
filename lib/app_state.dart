import 'package:flutter/foundation.dart';

class StudentRecord {
  final String id;
  final String name;
  final String department;
  final int age;
  final String email;

  StudentRecord({
    required this.id,
    required this.name,
    required this.department,
    required this.age,
    required this.email,
  });
}

class AppStateManager extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void selectTab(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  // DataTable sorting state
  bool _sortAscending = true;
  bool get sortAscending => _sortAscending;
  int _sortColumnIndex = 1;
  int get sortColumnIndex => _sortColumnIndex;

  final List<StudentRecord> _records = [
    StudentRecord(id: '1', name: 'Ali Tan', department: 'Software Engineering', age: 21, email: 'ali.tan@uni.edu.my'),
    StudentRecord(id: '2', name: 'Sara Lee', department: 'Computer Systems', age: 22, email: 'sara.lee@uni.edu.my'),
    StudentRecord(id: '3', name: 'Michael Tan', department: 'Network Computing', age: 23, email: 'michael.tan@uni.edu.my'),
    StudentRecord(id: '4', name: 'Aminul Islam', department: 'Software Engineering', age: 24, email: 'aminul.islam@uni.edu.my'),
    StudentRecord(id: '5', name: 'Zainab Binti Ali', department: 'Computational Science', age: 20, email: 'zainab@uni.edu.my'),
    StudentRecord(id: '6', name: 'Bala Subaramaniam', department: 'Artificial Intelligence', age: 22, email: 'bala@uni.edu.my'),
    StudentRecord(id: '7', name: 'Aina Rahman', department: 'Software Engineering', age: 21, email: 'aina@uni.edu.my'),
    StudentRecord(id: '8', name: 'David Ng', department: 'Multimedia Computing', age: 23, email: 'david.ng@uni.edu.my'),
    StudentRecord(id: '9', name: 'Siti Nurhaliza', department: 'Software Engineering', age: 20, email: 'siti@uni.edu.my'),
    StudentRecord(id: '10', name: 'John Doe', department: 'Information Systems', age: 25, email: 'john.doe@uni.edu.my'),
  ];

  List<StudentRecord> get records => _records;

  void sortRecords<T>(Comparable<T> Function(StudentRecord s) getField, int columnIndex, bool ascending) {
    _records.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    _sortColumnIndex = columnIndex;
    _sortAscending = ascending;
    notifyListeners();
  }
}