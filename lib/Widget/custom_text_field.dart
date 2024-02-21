import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import '../../Helper/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? title;
  final String? hintText;
  final bool readOnly;
  final bool isRequired;
  final bool? obscure;
  final bool isExpand;
  final int maxLine;
  final int? maxLength;
  final Color color;
  final double borderRadius;
  final TextInputType textInputType;
  final Function? onValue;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final BorderRadius? customBorder;

  const CustomTextField(
      {super.key, required this.textEditingController,
        this.title,
        this.hintText,
        this.readOnly = false,
        this.isRequired = false,
        this.isExpand = false,
        this.color = NEUTRAL_N10,
        this.borderRadius = 2.0,
        this.maxLine = 1,
        this.textInputType = TextInputType.text,
        this.onValue,
        this.validator,
        this.onChange,
        this.inputFormatters,
        this.suffixIcon, this.obscure, this.customBorder, this.maxLength = 100});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: PRIMARY_COLOR, width: 1.0),
          borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: const Color(0xff000000).withOpacity(0.1), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
        ),
        contentPadding: const EdgeInsets.all(15),
        errorStyle: ERROR_TEXT_STYLE,
        fillColor: color,
        filled: true,
        hintText: hintText ?? "",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        suffixIcon: suffixIcon,
      ),
      // onChanged: (value) => onValue != null ? onValue!(value) : null,
      onChanged: onChange,
      controller: textEditingController,
      readOnly: readOnly,
      validator: validator,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      style: const TextStyle(fontSize: 15, color: BLACK),
      maxLines: maxLine,
    );
  }
}
