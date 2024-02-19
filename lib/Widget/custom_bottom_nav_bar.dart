import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube_project_tracker/Helper/colors.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavbar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: PRIMARY_COLOR,
      unselectedItemColor: NEUTRAL_N700,
      showUnselectedLabels: true,
      elevation: 0,
      backgroundColor: NEUTRAL_N10,
      selectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
      unselectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.house),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.magnifying_glass),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.squares_four),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.bag),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.user),
          label: 'Profile',
        ),
      ],
      onTap: onTap,
    );
  }
}
