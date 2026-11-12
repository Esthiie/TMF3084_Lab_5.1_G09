/// One student in StudentHub.
class Student {
  const Student({
    required this.name,
    required this.matricNo,
    required this.programmeCode,
    required this.email,
    required this.yearOfStudy,
    required this.cgpa,
  });

  final String name;
  final String matricNo;
  final String programmeCode; // SE, DE, CS, NC or MC
  final String email;
  final int yearOfStudy;
  final double cgpa;

  /// First letter of the first and last name, e.g. "Sara Lee" -> "SL".
  String get initials {
    final parts = name.trim().split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}
