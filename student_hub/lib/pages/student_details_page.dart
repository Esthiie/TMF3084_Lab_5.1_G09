import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/programmes.dart';
import '../models/student.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key, required this.student});

  final Student student;

  void _copyInfo(BuildContext context, Programme programme) {
    final info =
        'Name: ${student.name}\n'
        'Matric No: ${student.matricNo}\n'
        'Programme: ${programme.name} (${programme.code})\n'
        'Email: ${student.email}';

    Clipboard.setData(ClipboardData(text: info));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Student info copied')));
  }

  @override
  Widget build(BuildContext context) {
    final programme = programmeByCode(student.programmeCode);
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. Profile header
          Center(
            child: CircleAvatar(
              radius: 52,
              backgroundColor: programme.color,
              child: Text(
                student.initials,
                style: const TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            student.name,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // 2. Detailed information
          Card(
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.school_outlined,
                  label: 'Programme',
                  value: '${programme.name} (${programme.code})',
                ),
                _InfoRow(
                  icon: Icons.badge_outlined,
                  label: 'Matric No',
                  value: student.matricNo,
                  selectable: true,
                ),
                _InfoRow(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: student.email,
                  selectable: true,
                ),
                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  label: 'Year of study',
                  value: 'Year ${student.yearOfStudy}',
                ),
                _InfoRow(
                  icon: Icons.star_outline,
                  label: 'CGPA',
                  value: student.cgpa.toStringAsFixed(2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 3. Copy button
          FilledButton.icon(
            onPressed: () => _copyInfo(context, programme),
            icon: const Icon(Icons.copy),
            label: const Text('Copy Info'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Long-press the matric number or email to select it.',
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

/// One line of information: icon, label and value.
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.selectable = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    final valueStyle = Theme.of(context).textTheme.bodyLarge;

    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(label, style: Theme.of(context).textTheme.labelMedium),
      subtitle: selectable
          ? SelectableText(value, style: valueStyle)
          : Text(value, style: valueStyle),
    );
  }
}
