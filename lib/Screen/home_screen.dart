import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_project_tracker/Controller/keeper_controller.dart';
import 'package:scube_project_tracker/Controller/screen_controller.dart';
import 'package:scube_project_tracker/Util/Util%20Widgets/app_exit_dialog.dart';
import 'package:scube_project_tracker/Widget/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final keeperController = Get.find<KeeperController>();
  final screenController = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _showExitDialog,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() => screenController.widgetOptions
            .elementAt(screenController.selectedIndex.value)),
        bottomNavigationBar: Obx(
              () => SizedBox(
            height: 68,
            child: CustomBottomNavbar(
                currentIndex: screenController.selectedIndex.value,
                onTap: (index) {
                }),
          ),
        ),
      ),
    );
  }

  void _showExitDialog(bool didPop) {
    showDialog<void>(
      context: Get.context!,
      builder: (BuildContext context) {
        return AppExitDialog();
      },
    );
  }
}
