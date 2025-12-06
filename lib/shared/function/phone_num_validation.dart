String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'برجاء ادخال رقم الهاتف';
  }
  if (!value.startsWith('07')) {
    return 'برجاءادخال رقم هاتف يبدأ 07';
  }
  if (value.length != 11) {
    return 'رقم الهاتف يجب أن يكون 11 رقم';
  }

  return null;
}

String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'برجاء ادخال الاسم';
  }
  if (value.length < 2) {
    return 'الاسم يجب أن يكون على الأقل 2 حرف';
  }
  return null;
}
