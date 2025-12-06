
// extension GetJoinedAgo on DateTime? {
//   String? get joinedAgo {
//     if (this == null) return null;
//     return getJoinedAgo(this);
//   }
// }

extension ArabicFormat on DateTime? {
  /// Formats the DateTime to Arabic date format like "19 أبريل 2024"
  String get toArabicFormat {
    if (this == null) return '';

    final date = this!;
    final day = date.day;
    final month = _getArabicMonth(date.month);
    final year = date.year;

    return '$day $month $year';
  }

  /// Formats the DateTime to Arabic date format with Arabic numerals
  String get toArabicFormatWithArabicNumerals {
    if (this == null) return '';

    final date = this!;
    final day = _convertToArabicNumerals(date.day.toString());
    final month = _getArabicMonth(date.month);
    final year = _convertToArabicNumerals(date.year.toString());

    return '$day $month $year';
  }

  /// Gets the Arabic month name based on month number
  String _getArabicMonth(int month) {
    const arabicMonths = {
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

    return arabicMonths[month] ?? '';
  }

  /// Converts English numerals to Arabic numerals
  String _convertToArabicNumerals(String englishNumber) {
    const englishToArabic = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    String result = englishNumber;
    englishToArabic.forEach((english, arabic) {
      result = result.replaceAll(english, arabic);
    });

    return result;
  }

  /// Formats the DateTime to short Arabic date format like "19/4/2024"
  String get toShortArabicFormat {
    if (this == null) return '';

    final date = this!;
    return '${date.day}/${date.month}/${date.year}';
  }

  /// Formats the DateTime to short Arabic date format with Arabic numerals
  String get toShortArabicFormatWithArabicNumerals {
    if (this == null) return '';

    final date = this!;
    final day = _convertToArabicNumerals(date.day.toString());
    final month = _convertToArabicNumerals(date.month.toString());
    final year = _convertToArabicNumerals(date.year.toString());

    return '$day/$month/$year';
  }

  /// Formats the DateTime to full Arabic date format with day name
  String get toFullArabicFormat {
    if (this == null) return '';

    final date = this!;
    final dayName = _getArabicDayName(date.weekday);
    final day = date.day;
    final month = _getArabicMonth(date.month);
    final year = date.year;

    return '$dayName، $day $month $year';
  }

  String get toFullArabicFormatWithoutYear {
    if (this == null) return '';

    final date = this!;
    final dayName = _getArabicDayName(date.weekday);
    final day = date.day;
    final month = _getArabicMonth(date.month);

    return '$dayName $day $month';
  }

  /// Gets the Arabic day name based on weekday number
  String _getArabicDayName(int weekday) {
    const arabicDays = {
      1: 'الاثنين',
      2: 'الثلاثاء',
      3: 'الأربعاء',
      4: 'الخميس',
      5: 'الجمعة',
      6: 'السبت',
      7: 'الأحد',
    };

    return arabicDays[weekday] ?? '';
  }
}

extension TimeOfDayFormat on DateTime? {
  /// Formats the DateTime to Arabic time format like "2:30 م"
  String get toArabicTimeFormat {
    if (this == null) return '';

    final date = this!;
    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');

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

    return '$formattedHour:$minute $period';
  }
}

extension TimeOfDayFormatFromString on String? {
  /// Formats a 24-hour time string like "14:30" to Arabic 12-hour format like "2:30 م".
  /// - Returns '' for null/empty input
  /// - Returns the original input if parsing fails or time is out of range
  String get toArabicTimeFormat {
    if (this == null) return '';
    final input = this!.trim();
    if (input.isEmpty) return '';

    final parts = input.split(':');
    if (parts.length < 2) return input;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) return input;
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return input;

    final h12 = (hour % 12 == 0) ? 12 : hour % 12;
    final minuteStr = minute.toString().padLeft(2, '0');
    final period = hour < 12 ? 'ص' : 'م';

    return '$h12:$minuteStr $period';
  }

  /// Formats various time string inputs to English 12-hour format like "2:30 PM".
  /// Accepts:
  /// - 24-hour format: "14:30"
  /// - English 12-hour: "2:30 PM" or "9:05 am"
  /// - Arabic 12-hour: "٢:٣٠ م" or "9:05 ص"
  /// Returns '' for null/empty input. Returns the original input if parsing fails.
  String get fromArabicToEnglishTimeFormat {
    if (this == null) return '';
    final input = this!.trim();
    if (input.isEmpty) return '';

    final parts = input.split(':');
    if (parts.length < 2) return input;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) return input;
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return input;

    final h12 = (hour % 12 == 0) ? 12 : hour % 12;
    final minuteStr = minute.toString().padLeft(2, '0');
    final period = hour < 12 ? 'AM' : 'PM';

    final r = '$h12:$minuteStr $period';
    return r;
  }
  // make get joined ago function
  
}
