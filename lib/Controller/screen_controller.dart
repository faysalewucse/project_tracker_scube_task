import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_project_tracker/Screen/home/home.dart';

class ScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  late List<Widget> widgetOptions;

  ScreenController() {
    widgetOptions = <Widget>[
       const Home(),
    ];
  }
}
