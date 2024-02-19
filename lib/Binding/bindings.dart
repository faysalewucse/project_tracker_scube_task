import 'package:get/get.dart';
import 'package:scube_project_tracker/Controller/project_controller.dart';
import 'package:scube_project_tracker/Controller/screen_controller.dart';
import '../Controller/keeper_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(KeeperController());
    Get.put(ScreenController());
    Get.put(ProjectController());
  }

}