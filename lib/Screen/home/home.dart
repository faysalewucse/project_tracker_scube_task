import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:scube_project_tracker/Controller/project_controller.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Model/Project.dart';
import 'package:scube_project_tracker/Screen/primary_screen.dart';
import 'package:scube_project_tracker/Widget/cards/project_card.dart';
import 'package:scube_project_tracker/Widget/custom_loading.dart';
import 'package:scube_project_tracker/Widget/sheets/project_bottom_sheet.dart';

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

  Future<void> _onRefresh() async {
    await projectController.getAllProjects();
  }

  @override
  void initState() {
    _initCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      body: RefreshIndicator(
        color: PRIMARY_COLOR,
        onRefresh: _onRefresh,
        child: Obx(
              () => projectController.loadingProjectList.value
              ? const CustomLoader()
              : Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...projectController.projects.reversed.map(
                        (project) => Column(
                      children: [
                        ProjectCard(
                          project: project,
                          onEditIconTap: () {
                            showUpdateProjectBottomSheet(context, project);
                          },
                        ),
                        VERTICAL_GAP_16
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddProjectBottomSheet(context);
        },
        backgroundColor: PRIMARY_COLOR, // Adjust color as needed
        shape: RoundedRectangleBorder(borderRadius: ROUNDED_2),
        child: const Icon(Icons.add, color: WHITE,), // For circular shape
      ),
    );
  }

  void showAddProjectBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const ContinuousRectangleBorder(
        side: BorderSide(
          color: Colors.transparent, // Border color
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const ProjectBottomSheet(),
        );
      },
    );
  }

  void showUpdateProjectBottomSheet(BuildContext context, Project project) {
    showModalBottomSheet(
      context: context,
      shape: const ContinuousRectangleBorder(
        side: BorderSide(
          color: Colors.transparent, // Border color
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ProjectBottomSheet(project: project, forUpdate: true,),
        );
      },
    );
  }
}
