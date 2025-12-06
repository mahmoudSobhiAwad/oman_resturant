extension PhoneNumberFormatter on String {
  String get formatAsPhoneNumber {
    // Remove any non-digit characters
    String digits = replaceAll(RegExp(r'\D'), '');

    // Check if the number starts with country code
    String countryCode = '';
    String number = digits;

    if (startsWith('+20') || startsWith('20')) {
      countryCode = '+20';
      number =
          digits.startsWith('20') ? digits.substring(2) : digits.substring(3);
    } else if (startsWith('+964') || startsWith('964')) {
      countryCode = '+964';
      number =
          digits.startsWith('964') ? digits.substring(3) : digits.substring(4);
    }

    // Format based on country code
    if (countryCode == '+20' && number.length == 10) {
      // Egyptian format: +20 XXX XXXX XXXX
      return '$countryCode ${number.substring(0, 3)} ${number.substring(3, 7)} ${number.substring(7)}';
    } else if (countryCode == '+964' && number.length == 10) {
      // Iraqi format: +964 XXX XXXX XXXX
      return '$countryCode ${number.substring(0, 3)} ${number.substring(3, 7)} ${number.substring(7)}';
    }

    // Return original if format doesn't match
    return this;
  }
}
