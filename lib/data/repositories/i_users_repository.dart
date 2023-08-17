import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_app_1/common/errors/user_api_client_error.dart';
import 'package:test_app_1/data/apis/user_api_client.dart';
import 'package:test_app_1/data/datasources/user_local_datasource.dart';
import 'package:test_app_1/data/models/user_model.dart';
import 'package:test_app_1/domain/entities/page.dart';
import 'package:test_app_1/domain/entities/user.dart';
import 'package:test_app_1/domain/repositories/users_repository.dart';
import 'package:test_app_1/domain/services/internet_connection_service.dart';

class IUsersRepository extends UsersRepository {
  final UserApiClient _userApiClient;
  final UserLocalDatasource _userLocalDatasource;

  IUsersRepository({
    required UserApiClient userApiClient,
    required UserLocalDatasource userLocalDatasource,
  })  : _userApiClient = userApiClient,
        _userLocalDatasource = userLocalDatasource;

  @override
  Future<Page> fetchAllUsersPage({required int page}) async {
    try {
      if (Get.find<InternetConnectionService>().isConnected.value) {
        final pageModel = await _userApiClient.fetchAllUsersPage(page: page);

        _userLocalDatasource.saveAllUsersPage(pageModel: pageModel);
        for (UserModel userModel in pageModel.data) {
          _userLocalDatasource.saveUser(userModel: userModel);
        }

        log('load with internet');

        return Page.fromPageModel(pageModel: pageModel);
      } else {
        final pageModel =
            await _userLocalDatasource.retrieveAllUsersPage(page: page);

        log('load without internet');

        return Page.fromPageModel(pageModel: pageModel);
      }
    } on UserApiClientError {
      final pageModel =
          await _userLocalDatasource.retrieveAllUsersPage(page: page);

      return Page.fromPageModel(pageModel: pageModel);
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<User> fetchUser({required int id}) async {
    try {
      if (Get.find<InternetConnectionService>().isConnected.value) {
        final userModel = await _userApiClient.fetchUser(id: id);

        log('load with internet');

        return User.fromUserModel(userModel: userModel);
      } else {
        final userModel = await _userLocalDatasource.retrieveUser(id: id);

        log('load without internet');

        return User.fromUserModel(userModel: userModel);
      }
    } on UserApiClientError {
      final userModel = await _userLocalDatasource.retrieveUser(id: id);

      return User.fromUserModel(userModel: userModel);
    } catch (exception) {
      rethrow;
    }
  }
}
