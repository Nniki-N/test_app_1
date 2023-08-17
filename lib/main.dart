import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_1/common/utils/dependency.dart';
import 'package:test_app_1/domain/services/internet_connection_service.dart';
import 'package:test_app_1/presentation/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyCreator.init();
  await initServices();

  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => InternetConnectionService().init());
}
