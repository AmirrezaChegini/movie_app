import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

class TextFieldAuth extends StatelessWidget {
  const TextFieldAuth({
    super.key,
    required this.hint,
    required this.validate,
    required this.textInputType,
    required this.textInputAction,
    this.isObsecure = false,
    this.suffixIcon,
  });

  final String hint;
  final Function(String) validate;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool isObsecure;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validate(value!),
      keyboardType: textInputType,
      obscureText: isObsecure,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: AppColor.black.withOpacity(0.5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.black,
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
