import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scube_project_tracker/Controller/keeper_controller.dart';

class AppExitDialog extends StatelessWidget {
   AppExitDialog({super.key});

  final keeperController = Get.find<KeeperController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
      title: const Text('Confirm Exit?'),
      content: const Text(
        'Are you sure you want to quit?',
      ),
      actions: <Widget>[
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            )),
        GestureDetector(
          onTap: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else {
              exit(0);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Quit',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ],
    );
  }
}
