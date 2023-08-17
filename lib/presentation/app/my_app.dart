import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:test_app_1/common/routes/app_pages.dart';
import 'package:test_app_1/common/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.main,
    );
  }
}
