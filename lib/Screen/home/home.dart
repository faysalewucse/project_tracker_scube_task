import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:scube_project_tracker/Controller/project_controller.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Screen/primary_screen.dart';
import 'package:scube_project_tracker/Widget/cards/project_card.dart';
import 'package:scube_project_tracker/Widget/custom_loading.dart';

import '../../Helper/image_source_url.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final projectController = Get.find<ProjectController>();

  void _initCall() async {
    await projectController.getAllProjects();
  }

  @override
  void initState() {
    // TODO: implement initState
    _initCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
        body: Obx(
      () => projectController.loadingProjectList.value
          ? const CustomLoader()
          : Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...projectController.projects.map(
                      (project) => Column(
                        children: [
                          ProjectCard(project: project),
                          VERTICAL_GAP_16
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    ));
  }
}
