import 'dart:math';

class RandomDateGenerator {
  static DateTime execute() {
    final random = Random();
    final startDate = DateTime(1996, 03, 11);
    final endDate = DateTime(2023, 12, 31);

    final randomDay = random.nextInt(endDate.difference(startDate).inDays);
    return startDate.add(Duration(days: randomDay));
  }
}

