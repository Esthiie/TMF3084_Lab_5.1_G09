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

                        // Student ID column
                        const DataColumn(
                            label: Text('ID'),
                        ),

                        // Name column with sorting functionality
                        DataColumn(
                            label: const Text('Name'),
                            onSort: (columnIndex, ascending) {
                                state.sortRecords((s) => s.name, columnIndex, ascending);
                            },
                        ),

                        // Department column
                        const DataColumn(label: Text('Department')),

                        // Age column with sorting functionality
                        DataColumn(
                            label: const Text('Age'),
                            numeric: true,
                            onSort: (columnIndex, ascending) {
                                state.sortRecords((s) => s.age, columnIndex, ascending);
                            },
                        ),
                    ],

                    // Generate rows from each student records
                    rows: state.records.map((record) {
                        return DataRow(
                            cells: [

                                // Display student details
                                DataCell(Text(record.id)),
                                DataCell(Text(record.name)),
                                DataCell(Text(record.department)),
                                DataCell(Text(record.age.toString())),
                            ],
                        );
                    }).toList(),
                ),
            ),
        );
    }
}