import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_project_tracker/Helper/route_url.dart';
import 'package:scube_project_tracker/Widget/custom_loading.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () => Get.offNamed(homeScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomLoader(),
      ),
    );
  }
}
