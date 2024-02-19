import 'package:dio/dio.dart';
import 'package:scube_project_tracker/API/api.dart';
import 'package:scube_project_tracker/Helper/api_url.dart';
import 'package:scube_project_tracker/Model/Project.dart';

class ProjectService {
  static Future<Response> getAllProjects() async {
    return await Api().dio.get(GET_ALL_PROJECTS_API_URL);
  }

  static Future<Response> addProject({required Project project}) async {
    return await Api().dio.post(ADD_PROJECT_API_URL, data: project.toJson());
  }

  static Future<Response> updateProject({required String projectId}) async {
    return await Api().dio.put("$UPDATE_PROJECT_API_URL/$projectId");
  }
}