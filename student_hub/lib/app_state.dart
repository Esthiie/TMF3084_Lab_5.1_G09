import 'package:flutter/foundation.dart';

// One student's data (field names match the group's Student model)
class StudentRecord {
  final String name;
  final String matricNo;
  final String programmeCode;
  final String email;
  final int yearOfStudy;
  final double cgpa;

  const StudentRecord({
    required this.name,
    required this.matricNo,
    required this.programmeCode,
    required this.email,
    required this.yearOfStudy,
    required this.cgpa,
  });
}

// Shared app state, provided to all pages through Provider
class AppStateManager extends ChangeNotifier {
  // Selected tab for the drawer and bottom navigation
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
    const StudentRecord(name: 'Estherne Liow', matricNo: '100101', programmeCode: 'SE', email: '100101@siswa.unimas.my', yearOfStudy: 3, cgpa: 3.90),
    const StudentRecord(name: 'Reselda Robie', matricNo: '100102', programmeCode: 'CS', email: '100102@siswa.unimas.my', yearOfStudy: 3, cgpa: 3.80),
    const StudentRecord(name: 'Daiyanti Juit', matricNo: '100103', programmeCode: 'MC', email: '100103@siswa.unimas.my', yearOfStudy: 2, cgpa: 3.65),
    const StudentRecord(name: 'Norasyikin Amirah', matricNo: '100104', programmeCode: 'DE', email: '100104@siswa.unimas.my', yearOfStudy: 3, cgpa: 3.70),
    const StudentRecord(name: 'Vanessa Fedillia', matricNo: '100105', programmeCode: 'NC', email: '100105@siswa.unimas.my', yearOfStudy: 2, cgpa: 3.55),
    const StudentRecord(name: 'Sara Lee', matricNo: '100106', programmeCode: 'MC', email: '100106@siswa.unimas.my', yearOfStudy: 4, cgpa: 3.85),
    const StudentRecord(name: 'Bala Subaramaniam', matricNo: '100107', programmeCode: 'CS', email: '100107@siswa.unimas.my', yearOfStudy: 1, cgpa: 3.40),
    const StudentRecord(name: 'Michael Tan', matricNo: '100108', programmeCode: 'DE', email: '100108@siswa.unimas.my', yearOfStudy: 2, cgpa: 3.25),
    const StudentRecord(name: 'Farah Aziz', matricNo: '100109', programmeCode: 'NC', email: '100109@siswa.unimas.my', yearOfStudy: 4, cgpa: 3.60),
    const StudentRecord(name: 'David Ng', matricNo: '100110', programmeCode: 'SE', email: '100110@siswa.unimas.my', yearOfStudy: 1, cgpa: 3.50),
  ];

  List<StudentRecord> get records => _records;

  // Sorts the list by any field, then updates the arrow state
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