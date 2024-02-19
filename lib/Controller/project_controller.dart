import 'package:get/get.dart';
import 'package:scube_project_tracker/Model/Project.dart';
import 'package:scube_project_tracker/Service/project_service.dart';
import 'package:scube_project_tracker/Util/Util.dart';

class ProjectController extends GetxController {
  final loadingProjectList = false.obs;
  final projects = <Project>[].obs;

  Future<void> getAllProjects() async {
    try {
      loadingProjectList(true);
      final response = await ProjectService.getAllProjects();

      var projectListData = response.data as List;

      var projectList = projectListData.map((project) {
        return Project.fromJson(project);
      }).toList();

      projects(projectList);

    } catch (err) {
      showApiErrorMessage(err);
    } finally {
      loadingProjectList(false);
    }
  }
}
