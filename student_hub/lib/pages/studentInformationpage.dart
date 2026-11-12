
import 'package:flutter/material.dart';
import '../models/student.dart';
import 'studentdetails.dart';

// Student data
final List<Student> studentData = [
  Student(
    name: 'Estherne Liow',
    studentId: '100101',
    programme: 'Software Engineering',
  ),
  Student(
    name: 'Reselda Robie',
    studentId: '100102',
    programme: 'Computational Science',
  ),
  Student(
    name: 'Daiyanti Juit',
    studentId: '100103',
    programme: 'Multimedia Computing',
  ),
  Student(
    name: 'Norasyikin Amirah',
    studentId: '100104',
    programme: 'Data Engineering',
  ),
  Student(
    name: 'Vanessa Fedillia',
    studentId: '100105',
    programme: 'Network Computing',
  ),
  Student(
    name: 'Sara Lee',
    studentId: '100106',
    programme: 'Multimedia Computing',
  ),
  Student(
    name: 'Bala Subaramaniam',
    studentId: '100107',
    programme: 'Computational Science',
  ),
  Student(
    name: 'Michael Tan',
    studentId: '100108',
    programme: 'Data Engineering',
  ),
  Student(
    name: 'Farah Aziz',
    studentId: '100109',
    programme: 'Network Computing',
  ),
  Student(
    name: 'David Ng',
    studentId: '100110',
    programme: 'Software Engineering',
  ),
];

class StudentInformationPage extends StatefulWidget {
  const StudentInformationPage({super.key});

  @override
  State<StudentInformationPage> createState() =>
      _StudentInformationPageState();
}

class _StudentInformationPageState
    extends State<StudentInformationPage> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedProgramme = 'All';

  final List<String> programmes = [
    'All',
    'Computational Science',
    'Data Engineering',
    'Software Engineering',
    'Network Computing',
    'Multimedia Computing',
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Student> get filteredStudents {
    return studentData.where((student) {
      final searchText = searchController.text.toLowerCase();

      final matchesSearch =
          student.name.toLowerCase().contains(searchText) ||
          student.studentId.toLowerCase().contains(searchText);

      final matchesProgramme =
          selectedProgramme == 'All' ||
          student.programme == selectedProgramme;

      return matchesSearch && matchesProgramme;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final students = filteredStudents;

    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Search student...',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        searchController.clear();
                        setState(() {});
                      },
                    )
                  : null,
              filled: true,
              fillColor: const Color(0xFFF0F2F5),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // Programme filter chips
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: programmes.map((programme) {
              final isSelected =
                  selectedProgramme == programme;

              return ChoiceChip(
                label: Text(
                  programme,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                selected: isSelected,
                showCheckmark: false,
                selectedColor: const Color(0xFF1479E8),
                backgroundColor: const Color(0xFFF0F2F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide.none,
                ),
                onSelected: (selected) {
                  setState(() {
                    selectedProgramme = programme;
                  });
                },
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 12),

        // Student list
        Expanded(
          child: students.isEmpty
              ? const Center(
                  child: Text(
                    'No students found',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    16, 4, 16, 16,
                  ),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];

                    return Card(
                      elevation: 2,
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),

                        // Student avatar
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFE3EEFF),
                          child: Icon(
                            Icons.person,
                            size: 34,
                            color: Color(0xFF5B9DEF),
                          ),
                        ),

                        // Student information
                        title: Text(
                          student.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        subtitle: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                student.studentId,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                student.programme,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Navigate to student details
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StudentDetailsPage(
                                student: student,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
