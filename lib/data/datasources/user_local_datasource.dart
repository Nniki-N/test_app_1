import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_1/common/errors/user_local_storage_error.dart';
import 'package:test_app_1/data/models/page_model.dart';
import 'package:test_app_1/data/models/user_model.dart';

abstract class UserStorageKeys {
  static const String allUsersPageKey = 'allUsersPageKey';
  static const String userKey = 'userKey';
}

class UserLocalDatasource {
  UserLocalDatasource();

  Future<PageModel> retrieveAllUsersPage({required int page}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(
        '${UserStorageKeys.allUsersPageKey}$page',
      );

      if (jsonString == null) {
        throw UserLocalStorageErrorUnableRetrieveAllUsers();
      }

      return PageModel.fromJson(json.decode(jsonString));
    } catch (exception) {
      throw UserLocalStorageErrorUnableRetrieveAllUsers();
    }
  }

  Future<void> saveAllUsersPage({required PageModel pageModel}) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
        '${UserStorageKeys.allUsersPageKey}${pageModel.page}',
        json.encode(pageModel.toJson()),
      );
    } catch (exception) {
      throw UserLocalStorageErrorUnableSaveeAllUsers();
    }
  }
  
  Future<UserModel> retrieveUser({required int id}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(
        '${UserStorageKeys.userKey}$id',
      );

      if (jsonString == null) {
        throw UserLocalStorageErrorUnableRetrieveAllUsers();
      }

      return UserModel.fromJson(json.decode(jsonString));
    } catch (exception) {
      throw UserLocalStorageErrorUnableRetrieveAllUsers();
    }
  }

  Future<void> saveUser({required UserModel userModel}) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
        '${UserStorageKeys.userKey}${userModel.id}',
        json.encode(userModel.toJson()),
      );
    } catch (exception) {
      throw UserLocalStorageErrorUnableSaveeAllUsers();
    }
  }
}
