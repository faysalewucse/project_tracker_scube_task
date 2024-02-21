import 'package:flutter/material.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Widget/custom_text_field.dart';

class TextFieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscure;
  final int? maxLine;
  final bool? required;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;

  const TextFieldWithLabel({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.obscure,
    this.maxLine = 1,
    this.required = true,
    this.labelStyle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
            if (required == true)
              const Text(
                " *",
                style: TextStyle(color: ERROR_500),
              ),
          ],
        ),
        VERTICAL_GAP_12,
        CustomTextField(
          obscure: obscure ?? false,
          suffixIcon: suffixIcon,
          hintText: hintText,
          textEditingController: controller,
          maxLine: maxLine ?? 1,
          validator: validator,
        ),
        VERTICAL_GAP_20,
      ],
    );
  }
}
