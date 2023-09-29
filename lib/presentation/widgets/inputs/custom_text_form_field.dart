import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMensage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMensage,
      this.onChanged,
      this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.0),
        borderSide: const BorderSide(color: Color.fromARGB(229, 42, 37, 37)));
    return TextFormField(
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border.copyWith(
              borderSide: BorderSide(color: colors.primary, width: 2)),
          errorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 2)),
          focusedErrorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 2)),
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hint,

          // icon: const Icon(Icons.person),
          // prefixIcon: const Icon(Icons.person),
          // suffixIcon: const Icon(Icons.person),
          errorText: errorMensage),
    );
  }
}
