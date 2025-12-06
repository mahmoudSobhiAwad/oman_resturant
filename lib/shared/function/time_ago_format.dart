import 'package:intl/date_symbol_data_local.dart';

String? getJoinedAgo(DateTime? joinedAt, {String? perfix = 'منذ'}) {
  if (joinedAt == null) return null;

  // Initialize Arabic locale for intl
  initializeDateFormatting('ar', null);

  final now = DateTime.now().toUtc();
  final difference = now.difference(joinedAt.toUtc());

  // Helper function to get Arabic plural form and format
  String getPluralForm(
    int count,
    String singular,
    String dual,
    String few,
    String many,
  ) {
    if (count == 1) return singular;
    if (count == 2) return dual;
    if (count >= 3 && count <= 10) return '$count $few';
    return '$count $many';
  }

  // Convert difference to appropriate time unit
  if (difference.inSeconds < 60) {
    final count = difference.inSeconds;
    if (count == 0) return 'الآن';
    return '$perfix ${getPluralForm(count, 'ثانية', 'ثانيتين', 'ثوانٍ', 'ثانية')}';
  } else if (difference.inMinutes < 60) {
    final count = difference.inMinutes;
    return '$perfix ${getPluralForm(count, 'دقيقة', 'دقيقتين', 'دقائق', 'دقيقة')}';
  } else if (difference.inHours < 24) {
    final count = difference.inHours;
    return '$perfix ${getPluralForm(count, 'ساعة', 'ساعتين', 'ساعات', 'ساعة')}';
  } else if (difference.inDays < 30) {
    final count = difference.inDays;
    return '$perfix ${getPluralForm(count, 'يوم', 'يومين', 'أيام', 'يوم')}';
  } else if (difference.inDays < 365) {
    final count = (difference.inDays / 30).floor();
    return '$perfix ${getPluralForm(count, 'شهر', 'شهرين', 'أشهر', 'شهر')}';
  } else {
    final count = (difference.inDays / 365).floor();
    return '$perfix ${getPluralForm(count, 'سنة', 'سنتين', 'سنوات', 'سنة')}';
  }
}
