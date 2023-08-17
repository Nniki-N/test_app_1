import 'package:get/get.dart';
import 'package:test_app_1/common/routes/argument_constants.dart';
import 'package:test_app_1/common/typedefs.dart';
import 'package:test_app_1/presentation/controllers/user_info/user_info_controller.dart';

class UserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(
      () => UserInfoController(
        userId: ((Get.arguments as Json)[ArgumentConstants.id] as int),
        usersRepository: Get.find(),
      ),
      permanent: false,
    );
  }
}
