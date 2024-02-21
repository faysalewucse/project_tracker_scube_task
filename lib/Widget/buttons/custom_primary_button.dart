import 'package:flutter/material.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Widget/custom_loading.dart';

class CustomPrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String label;
  final Color? color;
  final Function onClick;
  final Color? borderColor;
  final Color? labelColor;
  final bool? loading;

  const CustomPrimaryButton(
      {super.key,
        required this.label,
        required this.onClick,
        this.height = 48,
        this.width,
        this.color,
        this.borderColor,
        this.labelColor,
        this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(loading == false){
          onClick();
        }
      },
      child: Container(
        height: height,
        width: width ?? MAX_WIDTH,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
            color: color ?? PRIMARY_COLOR,
            borderRadius: ROUNDED_2,
            border: Border.all(color: borderColor ?? Colors.transparent)),
        child: Center(
          child: loading == true
              ? const CustomLoader(
            size: 30,
            color: WHITE,
          )
              : Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: labelColor ?? WHITE,
            ),
          ),
        ),
      ),
    );
  }
}
