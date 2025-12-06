
class ArabicDateFormatter {
  static const Map<int, String> _arabicMonths = {
    1: 'يناير',
    2: 'فبراير',
    3: 'مارس',
    4: 'أبريل',
    5: 'مايو',
    6: 'يونيو',
    7: 'يوليو',
    8: 'أغسطس',
    9: 'سبتمبر',
    10: 'أكتوبر',
    11: 'نوفمبر',
    12: 'ديسمبر',
  };

  /// Formats DateTime to Arabic format: " 28 أبريل 2025 - 2:30 م"
  static String formatToArabic(DateTime dateTime) {
    final day = dateTime.day;
    final month = _arabicMonths[dateTime.month] ?? '';
    final year = dateTime.year;

    // Format time to 12-hour format with Arabic AM/PM
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');

    String formattedHour;
    String period;

    if (hour == 0) {
      formattedHour = '12';
      period = 'ص'; // صباحاً (AM)
    } else if (hour < 12) {
      formattedHour = hour.toString();
      period = 'ص'; // صباحاً (AM)
    } else if (hour == 12) {
      formattedHour = '12';
      period = 'م'; // مساءً (PM)
    } else {
      formattedHour = (hour - 12).toString();
      period = 'م'; // مساءً (PM)
    }

    return ' $day $month $year - $formattedHour:$minute $period';
  }

  static String formatToArabicHours(String dateTime) {
    dateTime = dateTime.toLowerCase();
    if (dateTime.contains("am")) {
      final time = dateTime.replaceAll('am', '');
      return '$time ص';
    } else if (dateTime.contains("pm")) {
      final time = dateTime.replaceAll('pm', '');

      return '$time م';
    } else {
      return dateTime; // Return as is if format is unrecognized
    }
  }
}
