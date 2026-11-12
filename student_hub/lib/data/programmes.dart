import 'package:flutter/material.dart';

/// One academic programme, with its own colour and icon.
class Programme {
  const Programme({
    required this.code,
    required this.name,
    required this.color,
    required this.icon,
  });

  final String code;
  final String name;
  final Color color;
  final IconData icon;
}

const List<Programme> programmes = [
  Programme(
    code: 'SE',
    name: 'Software Engineering',
    color: Color(0xFF1565C0),
    icon: Icons.code,
  ),
  Programme(
    code: 'DE',
    name: 'Data Engineering',
    color: Color(0xFF00897B),
    icon: Icons.storage,
  ),
  Programme(
    code: 'CS',
    name: 'Computational Science',
    color: Color(0xFF6A1B9A),
    icon: Icons.functions,
  ),
  Programme(
    code: 'NC',
    name: 'Network Computing',
    color: Color(0xFFEF6C00),
    icon: Icons.lan,
  ),
  Programme(
    code: 'MC',
    name: 'Multimedia Computing',
    color: Color(0xFFC2185B),
    icon: Icons.movie_creation_outlined,
  ),
];

/// Finds a programme by its code, e.g. programmeByCode('SE').
Programme programmeByCode(String code) {
  return programmes.firstWhere((p) => p.code == code);
}
