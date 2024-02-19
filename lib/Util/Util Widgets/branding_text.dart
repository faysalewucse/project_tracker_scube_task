import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube_project_tracker/Helper/colors.dart';

class BrandingText extends StatelessWidget {
  final bool? forAppBar;

  const BrandingText({super.key, this.forAppBar});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Scube',
      style: forAppBar == true
          ? GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        color: PRIMARY_COLOR,
        letterSpacing: 0,
        fontSize: 28,
      )
          : GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        color: PRIMARY_COLOR,
        fontSize: 40,
      ),
    );
  }
}
