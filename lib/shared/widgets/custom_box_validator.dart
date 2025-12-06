import 'package:flutter/material.dart';

class CustomBoxValidator<T> extends FormField<T> {
  CustomBoxValidator({
    super.key,
    super.initialValue,
    super.validator,
    super.onSaved,
    required Widget Function(FormFieldState<T> state) builder,
    bool autovalidate = false,
  }) : super(
         autovalidateMode:
             autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
         builder: (state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               builder(state),
               if (state.hasError)
                 Padding(
                   padding: const EdgeInsets.only(top: 4.0),
                   child: Text(
                     state.errorText ?? '',
                     style: const TextStyle(color: Colors.red),
                   ),
                 ),
             ],
           );
         },
       );
}
