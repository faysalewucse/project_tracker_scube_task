import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scube_project_tracker/Binding/bindings.dart';
import 'package:scube_project_tracker/Helper/Theme.dart';
import 'Helper/Route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Scube',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: '/',
      getPages: RoutePages,
      locale: const Locale('en','US'),
      fallbackLocale: const Locale('en','US'),
      initialBinding: MyBindings(),
    );
  }
}
