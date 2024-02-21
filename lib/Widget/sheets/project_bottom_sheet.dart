import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scube_project_tracker/Controller/project_controller.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Model/Project.dart';
import 'package:scube_project_tracker/Util/Util%20Widgets/custom_date_picker.dart';
import 'package:scube_project_tracker/Util/text_field_validator.dart';
import 'package:scube_project_tracker/Widget/buttons/custom_primary_button.dart';
import 'package:scube_project_tracker/Widget/text_field_with_label.dart';

class ProjectBottomSheet extends StatefulWidget {
  final Project? project;
  final bool? forUpdate;

  const ProjectBottomSheet({super.key, this.project, this.forUpdate = false});

  @override
  State<ProjectBottomSheet> createState() => _ProjectBottomSheetState();
}

class _ProjectBottomSheetState extends State<ProjectBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final projectController = Get.find<ProjectController>();

  TextEditingController idController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startDayOfYearController = TextEditingController();
  TextEditingController endDayOfYearController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectUpdateController = TextEditingController();
  TextEditingController assignedEngineerController = TextEditingController();
  TextEditingController assignedTechnicianController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  void _initCall() {
    idController.text = widget.project!.id.toString();
    startDateController.text = widget.project!.startDate;
    endDateController.text = widget.project!.endDate;
    startDayOfYearController.text = widget.project!.startDayOfYear.toString();
    endDayOfYearController.text = widget.project!.endDayOfYear.toString();
    projectNameController.text = widget.project!.projectName;
    projectUpdateController.text = widget.project!.projectUpdate;
    assignedEngineerController.text = widget.project!.assignedEngineer;
    assignedTechnicianController.text = widget.project!.assignedTechnician;
    durationController.text = widget.project!.duration.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.forUpdate == true) {
      _initCall();
    }
    startDateController.text = DateFormat("yyyy-MM-dd").format(DateTime.now());
    endDateController.text = DateFormat("yyyy-MM-dd")
        .format(DateTime.now().add(const Duration(days: 10)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
      height: MAX_HEIGHT * 0.9,
      width: MAX_WIDTH,
      child: Column(
        children: [
          Container(
            height: MAX_HEIGHT * 0.1,
            width: MAX_WIDTH,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    widget.forUpdate == false
                        ? "Add Project"
                        : "Update Project",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: NEUTRAL_N10,
                          border: Border.all(color: NEUTRAL_N30),
                          borderRadius: ROUNDED_FULL
                      ),
                      child: const Icon(
                        Icons.close,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          VERTICAL_GAP_24,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDatePicker(
                        label: "Start Date",
                        initialDate: startDateController.text,
                        onDateSelected: (DateTime datetime) {
                          setState(() {
                            startDateController.text =
                                DateFormat('yyyy-MM-dd').format(datetime);
                          });
                        },
                        required: true,
                      ),
                      CustomDatePicker(
                        label: "End Date",
                        initialDate: endDateController.text,
                        onDateSelected: (DateTime datetime) {
                          setState(() {
                            endDateController.text =
                                DateFormat('yyyy-MM-dd').format(datetime);
                          });
                        },
                        required: true,
                      ),
                      TextFieldWithLabel(
                        controller: projectNameController,
                        label: "Project Name",
                        hintText: "e.g: 50 Solar Panel implementation",
                        required: true,
                        validator: (value) {
                          return TextFieldValidator().simpleValidator(
                              value: value,
                              errorMessage: "Project name should not be empty");
                          return null;
                        },
                      ),
                      TextFieldWithLabel(
                        controller: projectUpdateController,
                        label: "Project Update",
                        hintText: "e.g: 2024-02-20",
                        required: true,
                        validator: (value) {
                          return TextFieldValidator().simpleValidator(
                              value: value,
                              errorMessage:
                                  "Start Date name should not be empty");
                          return null;
                        },
                      ),
                      TextFieldWithLabel(
                        controller: assignedEngineerController,
                        label: "Assigned Engineer",
                        hintText: "e.g: Faysal",
                        required: true,
                        validator: (value) {
                          return TextFieldValidator().simpleValidator(
                              value: value,
                              errorMessage:
                                  "Engineer name should not be empty");
                          return null;
                        },
                      ),
                      TextFieldWithLabel(
                        controller: assignedTechnicianController,
                        label: "Assigned Technician",
                        hintText: "e.g: Ahmed",
                        required: true,
                        validator: (value) {
                          return TextFieldValidator().simpleValidator(
                              value: value,
                              errorMessage:
                                  "Engineer name should not be empty");
                          return null;
                        },
                      ),
                      Obx(
                        () => CustomPrimaryButton(
                          label: widget.forUpdate == false ? "Add" : "Update",
                          loading: projectController.loadingUpdateProject.value || projectController.loadingAddProject.value,
                          onClick: () {
                            if (_formKey.currentState!.validate() &&
                                !projectController.loadingUpdateProject.value &&
                                !projectController.loadingAddProject.value) {
                              if (widget.forUpdate == true) {
                                updateProject(widget.project!.id.toString());
                              } else {
                                addProject();
                              }
                            }
                          },
                        ),
                      ),
                      VERTICAL_GAP_24,
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void updateProject(String projectId) async {
    Project projectData = Project(
      id: int.parse(idController.text),
      startDate: startDateController.text,
      endDate: endDateController.text,
      startDayOfYear: int.parse(startDayOfYearController.text),
      endDayOfYear: int.parse(endDayOfYearController.text),
      projectName: projectNameController.text,
      projectUpdate: projectUpdateController.text,
      assignedEngineer: assignedEngineerController.text,
      assignedTechnician: assignedTechnicianController.text,
      duration: int.parse(durationController.text),
    );

    await projectController.updateProject(
        projectId: projectId, newData: projectData);

    Get.back();
  }

  void addProject() async {
    Project projectData = Project(
      startDate: startDateController.text,
      endDate: endDateController.text,
      startDayOfYear: 1,
      endDayOfYear: 365,
      projectName: projectNameController.text,
      projectUpdate: projectUpdateController.text,
      assignedEngineer: assignedEngineerController.text,
      assignedTechnician: assignedTechnicianController.text,
      duration: 365,
    );

    await projectController.addProject(
      projectData: projectData,
    );
  }
}
