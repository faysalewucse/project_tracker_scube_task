import 'package:get/get.dart';
import 'package:scube_project_tracker/Model/Project.dart';
import 'package:scube_project_tracker/Service/project_service.dart';
import 'package:scube_project_tracker/Util/Util.dart';

class ProjectController extends GetxController {
  final loadingProjectList = false.obs;
  final loadingUpdateProject = false.obs;
  final loadingAddProject = false.obs;
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

  Future<void> addProject({required Project projectData}) async {
    try {
      loadingAddProject(true);
      await ProjectService.addProject(project: projectData);
      await getAllProjects();
      Get.back();
      showMessage("Project Added Successfully", isSuccess: true);
    } catch (err) {
      showApiErrorMessage(err);
    } finally {
      loadingAddProject(false);
    }
  }

  Future<void> updateProject({required String projectId, required Project newData}) async {
    try {
      loadingUpdateProject(true);
      await ProjectService.updateProject(projectId: projectId, updatedProjectData: newData);
      await getAllProjects();
      Get.back();
      showMessage("Project Updated Successfully", isSuccess: true);
    } catch (err) {
      showApiErrorMessage(err);
    } finally {
      loadingUpdateProject(false);
    }
  }
}
