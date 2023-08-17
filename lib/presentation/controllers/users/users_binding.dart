import 'package:get/get.dart';
import 'package:test_app_1/presentation/controllers/users/users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UsersController(usersRepository: Get.find()));
  }
}
