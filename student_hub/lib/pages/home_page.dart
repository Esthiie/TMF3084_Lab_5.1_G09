import 'package:flutter/material.dart';

import '../data/programmes.dart';
import '../data/students_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('StudentHub'),
        centerTitle: true,
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Welcome card with picture
          const _WelcomeCard(),
          const SizedBox(height: 24),

          // 2. Dashboard overview
          Text(
            'Dashboard Overview',
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _OverviewCard(
                  icon: Icons.groups,
                  label: 'Total Students',
                  value: sampleStudents.length,
                  color: const Color(0xFF1E6FE0),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _OverviewCard(
                  icon: Icons.school,
                  label: 'Programmes',
                  value: programmes.length,
                  color: const Color(0xFF2E9D4F),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 3. Quick links
          Text(
            'Quick Links',
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _QuickLinkButton(
            icon: Icons.people_alt_outlined,
            label: 'View Students',
            onPressed: () => Navigator.pushNamed(context, '/students'),
          ),
          _QuickLinkButton(
            icon: Icons.table_chart_outlined,
            label: 'Student Records',
            onPressed: () => Navigator.pushNamed(context, '/records'),
          ),
          _QuickLinkButton(
            icon: Icons.info_outline,
            label: 'About',
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}

/// Light blue card with the welcome text and a cartoon picture.
/// Welcome banner. The picture already has the welcome text on it.
class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/welcome.jpeg',
        width: double.infinity,
        fit: BoxFit.cover,
        // If the picture is missing, show an icon instead of crashing.
        errorBuilder: (context, error, stackTrace) => Container(
          height: 180,
          color: colors.primaryContainer,
          child: Icon(Icons.groups_rounded, size: 120, color: colors.primary),
        ),
      ),
    );
  }
}

/// Coloured box showing one number, e.g. Total Students: 10.
class _OverviewCard extends StatelessWidget {
  const _OverviewCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            '$label:',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Rounded outlined button used for the quick links.
class _QuickLinkButton extends StatelessWidget {
  const _QuickLinkButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontSize: 16)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
