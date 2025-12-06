abstract class MonyHelper {
  static String formatMoney(num amount, {String replace = ','}) {
    // If amount exceeds 100 million, use abbreviation
    if (amount >= 1000000) {
      double millions = amount / 1000000;
      String numStr = millions
          .toStringAsFixed(1)
          .replaceAll(RegExp(r'\.0+$'), '');
      return '$numStr مليون';
    }

    // Convert to string and remove trailing zeros after decimal point
    String numStr = amount.toStringAsFixed(2).replaceAll(RegExp(r'\.0+$'), '');

    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String result = numStr.replaceAllMapped(
      reg,
      (Match m) => '${m[1]}$replace',
    );
    return result;
  }
}
