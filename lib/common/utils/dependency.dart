import 'package:get/get.dart';
import 'package:test_app_1/data/apis/user_api_client.dart';
import 'package:test_app_1/data/datasources/user_local_datasource.dart';
import 'package:test_app_1/data/repositories/i_users_repository.dart';
import 'package:test_app_1/domain/repositories/users_repository.dart';

class DependencyCreator {
  static void init() {
    Get.put(UserApiClient());
    Get.put(UserLocalDatasource());
    Get.put<UsersRepository>(
      IUsersRepository(
        userApiClient: Get.find(),
        userLocalDatasource: Get.find(),
      ),
    );
  }
}