import 'package:dio/dio.dart';
import 'package:scube_project_tracker/API/api.dart';
import 'package:scube_project_tracker/Helper/api_url.dart';
import 'package:scube_project_tracker/Model/Project.dart';

class ProjectService {
  static Future<Response> getAllProjects() async {
    return await Api().dio.get(GET_ALL_PROJECTS_API_URL);
  }

  static Future<Response> addProject({required Project project}) async {
    return await Api().dio.post(ADD_PROJECT_API_URL, data: {
      "start_date": project.startDate,
      "end_date": project.startDate,
      "project_name": project.projectName,
      "project_update": project.projectUpdate,
      "assigned_engineer": project.assignedEngineer,
      "assigned_technician": project.assignedTechnician
    });
  }

  static Future<Response> updateProject(
      {required String projectId, required Project updatedProjectData}) async {
    return await Api().dio.put("$UPDATE_PROJECT_API_URL/$projectId/", data: {
      "start_date": updatedProjectData.startDate,
      "end_date": updatedProjectData.startDate,
      "project_name": updatedProjectData.projectName,
      "project_update": updatedProjectData.projectUpdate,
      "assigned_engineer": updatedProjectData.assignedEngineer,
      "assigned_technician": updatedProjectData.assignedTechnician
    });
  }
}
