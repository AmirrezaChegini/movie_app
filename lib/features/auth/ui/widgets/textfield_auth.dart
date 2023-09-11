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
    required this.controller,
  });

  final String hint;
  final Function(String) validate;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool isObsecure;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validate(value!),
      controller: controller,
      keyboardType: textInputType,
      obscureText: isObsecure,
      textInputAction: textInputAction,
      style: const TextStyle(color: AppColor.white),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: AppColor.white.withOpacity(0.5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.red,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColor.white,
        ),
      ),
    );
  }
}
