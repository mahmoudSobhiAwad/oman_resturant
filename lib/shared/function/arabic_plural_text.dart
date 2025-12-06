String getArabicPluralForm(int count, {List<String> forms = const []}) {
  if (count == 1) {
    return forms.isNotEmpty ? forms[0] : "تقييم";
  } else if (count == 2) {
    return forms.isNotEmpty ? forms[1] : "تقييمان"; // "Ratings" (two)
  } else if (count >= 3 && count <= 10) {
    return forms.isNotEmpty ? forms[2] : "تقييمات"; // "Ratings" (few)
  } else if (count >= 11 && count <= 99) {
    return forms.isNotEmpty ? forms[3] : "تقيمًا"; // "Ratings" (many)
  } else {
    return forms.isNotEmpty
        ? forms[0]
        : "تقييم"; // "Ratings" (hundreds or more)
  }
}
