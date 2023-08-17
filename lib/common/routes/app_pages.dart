import 'package:get/get.dart';
import 'package:test_app_1/common/routes/app_routes.dart';
import 'package:test_app_1/presentation/controllers/user_info/user_info_binding.dart';
import 'package:test_app_1/presentation/controllers/users/users_binding.dart';
import 'package:test_app_1/presentation/screens/main_screen.dart';
import 'package:test_app_1/presentation/screens/user_info_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: AppRoutes.userInfo,
      page: () => const UserInfoScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(
        milliseconds: 200,
      ),
      binding: UserInfoBinding(),
    ),
  ];
}
