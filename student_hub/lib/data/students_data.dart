import '../models/student.dart';

const List<Student> sampleStudents = [
  Student(
    name: 'Estherne Liow',
    matricNo: '100101',
    programmeCode: 'SE',
    email: '100101@siswa.unimas.my',
    yearOfStudy: 3,
    cgpa: 3.90,
  ),
  Student(
    name: 'Reselda Robie',
    matricNo: '100102',
    programmeCode: 'CS',
    email: '100102@siswa.unimas.my',
    yearOfStudy: 3,
    cgpa: 3.80,
  ),
  Student(
    name: 'Daiyanti Juit',
    matricNo: '100103',
    programmeCode: 'MC',
    email: '100103@siswa.unimas.my',
    yearOfStudy: 2,
    cgpa: 3.65,
  ),
  Student(
    name: 'Norasyikin Amirah',
    matricNo: '100104',
    programmeCode: 'DE',
    email: '100104@siswa.unimas.my',
    yearOfStudy: 3,
    cgpa: 3.70,
  ),
  Student(
    name: 'Vanessa Fedillia',
    matricNo: '100105',
    programmeCode: 'NC',
    email: '100105@siswa.unimas.my',
    yearOfStudy: 2,
    cgpa: 3.55,
  ),
  Student(
    name: 'Sara Lee',
    matricNo: '100106',
    programmeCode: 'MC',
    email: '100106@siswa.unimas.my',
    yearOfStudy: 4,
    cgpa: 3.85,
  ),
  Student(
    name: 'Bala Subaramaniam',
    matricNo: '100107',
    programmeCode: 'CS',
    email: '100107@siswa.unimas.my',
    yearOfStudy: 1,
    cgpa: 3.40,
  ),
  Student(
    name: 'Michael Tan',
    matricNo: '100108',
    programmeCode: 'DE',
    email: '100108@siswa.unimas.my',
    yearOfStudy: 2,
    cgpa: 3.25,
  ),
  Student(
    name: 'Farah Aziz',
    matricNo: '100109',
    programmeCode: 'NC',
    email: '100109@siswa.unimas.my',
    yearOfStudy: 4,
    cgpa: 3.60,
  ),
  Student(
    name: 'David Ng',
    matricNo: '100110',
    programmeCode: 'SE',
    email: '100110@siswa.unimas.my',
    yearOfStudy: 1,
    cgpa: 3.50,
  ),
];

/// How many students are in one programme.
int countStudentsIn(String programmeCode) {
  return sampleStudents.where((s) => s.programmeCode == programmeCode).length;
}
