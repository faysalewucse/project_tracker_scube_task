import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:scube_project_tracker/Controller/screen_controller.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Util/Util%20Widgets/branding_text.dart';

class PrimaryScreen extends StatelessWidget {
  final Widget body;

  PrimaryScreen({Key? key, required this.body}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final screenController = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> titles = {
      0: const BrandingText(forAppBar: true),
      1: Text(
        "Search",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      2: Text(
        "Category",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      3: Text(
        "Cart",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      4: Text(
        "Profile",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    };

    return Scaffold(
      key: _scaffoldKey,
      // drawer: CustomDrawer(
      //   scaffoldKey: _scaffoldKey,
      // ),
      appBar: AppBar(
        backgroundColor: NEUTRAL_N10,
        titleSpacing: 0,
        title: Obx(() => titles[screenController.selectedIndex.value]!),
        leading: IconButton(
          icon: const Icon(PhosphorIcons.list),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: body,
    );
  }
}
