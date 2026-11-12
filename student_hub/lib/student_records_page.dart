import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

// Student Records Page displays student data using a DataTable widget
// Data is managed through Provider (AppStateManager)
class StudentRecordsPage extends StatelessWidget {
    const StudentRecordsPage({super.key});

    @override
    Widget build(BuildContext context) {

        // Access shared application state from Provider
        final state = context.watch<AppStateManager>();

        return SingleChildScrollView(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                // DataTable used to display student records
                child: DataTable(

                    // Controls sorting indicator and direction
                    sortColumnIndex: state.sortColumnIndex,
                    sortAscending: state.sortAscending,
                    columns: [

                        // Column 0: Matric number (not sortable)
                        const DataColumn(
                            label: Text('Matric No'),
                        ),

                        // Column 1: Name with sorting functionality
                        DataColumn(
                            label: const Text('Name'),
                            onSort: (columnIndex, ascending) {
                                state.sortRecords((s) => s.name, columnIndex, ascending);
                            },
                        ),

                        // Column 2: Programme code (not sortable)
                        const DataColumn(label: Text('Programme')),

                        // Column 3: Year of study (not sortable)
                        const DataColumn(
                            label: Text('Year'),
                            numeric: true,
                        ),

                        // Column 4: CGPA with sorting functionality
                        DataColumn(
                            label: const Text('CGPA'),
                            numeric: true,
                            onSort: (columnIndex, ascending) {
                                state.sortRecords((s) => s.cgpa, columnIndex, ascending);
                            },
                        ),
                    ],

                    // Generate one row for each student record
                    rows: state.records.map((record) {
                        return DataRow(
                            cells: [

                                // Cell order must match the column order above
                                DataCell(Text(record.matricNo)),
                                DataCell(Text(record.name)),
                                DataCell(Text(record.programmeCode)),
                                DataCell(Text(record.yearOfStudy.toString())),
                                // Show CGPA with 2 decimals (3.5 becomes 3.50)
                                DataCell(Text(record.cgpa.toStringAsFixed(2))),
                            ],
                        );
                    }).toList(),
                ),
            ),
        );
    }
}