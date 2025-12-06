/// Helper class for handling Arabic plural forms
class ArabicPluralHelper {
  /// Returns the appropriate plural form for orders in Arabic
  ///
  /// Rules:
  /// - 1: منتج (single)
  /// - 2: منتجين (dual)
  /// - 3-10: منتجات (plural)
  /// - 11-99: منتج (plural with number)
  /// - 100+: منتج (plural with number)
  static String orderPlural(int count) {
    if (count == 1) {
      return 'منتج';
    } else if (count == 2) {
      return 'منتجين';
    } else if (count >= 3 && count <= 10) {
      return '$count منتجات';
    } else {
      return '$count منتج';
    }
  }

  /// Returns the full string with count and plural form
  /// Example: "3 منتجات", "1 منتج", "2 منتجين"
  static String orderPluralWithCount(int count) {
    return '$count ${orderPlural(count)}';
  }

  /// Generic Arabic plural helper that can be used for any word
  ///
  /// Parameters:
  /// - [count]: The number to determine plural form
  /// - [singular]: Word for count = 1
  /// - [dual]: Word for count = 2
  /// - [plural]: Word for count 3-10
  /// - [pluralWithNumber]: Word for count 11+ (defaults to singular if not provided)
  static String customPlural({
    required int count,
    required String singular,
    required String dual,
    required String plural,
    String? pluralWithNumber,
  }) {
    if (count == 1) {
      return singular;
    } else if (count == 2) {
      return dual;
    } else if (count >= 3 && count <= 10) {
      return plural;
    } else {
      return pluralWithNumber ?? singular;
    }
  }

  /// Returns the full string with count and custom plural form
  static String customPluralWithCount({
    required int count,
    required String singular,
    required String dual,
    required String plural,
    String? pluralWithNumber,
  }) {
    return '$count ${customPlural(count: count, singular: singular, dual: dual, plural: plural, pluralWithNumber: pluralWithNumber)}';
  }
}
