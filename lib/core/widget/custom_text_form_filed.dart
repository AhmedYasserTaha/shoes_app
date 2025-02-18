import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final bool obscureText;
  final String? text;
  final String? hintText;
  final String? label;
  final String? Function(String?)? validator; // التحقق من صحة المدخلات

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.inputType,
    this.suffexIcon,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    required this.text,
    this.hintText,
    this.label,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null) // تجنب عرض نص فارغ
          Text(
            text!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        const Gap(10),
        TextFormField(
          controller: controller, // استخدام الكنترولر
          keyboardType: inputType,
          onChanged: onChanged,
          onSaved: onSaved,
          obscureText: obscureText,
          validator: validator, // تمرير دالة التحقق
          decoration: InputDecoration(
            // labelText: label,
            // hintText: hintText,
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xffcccccc),
              ),
            ),
            suffixIcon: suffexIcon,
          ),
        ),
      ],
    );
  }
}
