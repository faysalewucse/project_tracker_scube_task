import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Model/Project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: ROUNDED_2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.projectName,
                  style:
                  Theme.of(context).textTheme.displayLarge,
                ),
                VERTICAL_GAP_5,
                Row(
                  children: [
                    Text(
                      project.startDate,
                      style:
                      Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      ' to ',
                      style:
                      Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      project.endDate,
                      style:
                      Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Text(
                  'Assigned Engineer: ${project.assignedEngineer}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Assigned Technician: ${project.assignedTechnician}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  project.projectUpdate,
                  style: const TextStyle(
                      fontSize: 12.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(PhosphorIcons.pencil_light, color: PRIMARY_COLOR,)
        ],
      ),
    );
  }
}
