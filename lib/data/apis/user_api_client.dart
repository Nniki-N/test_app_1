import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app_1/common/errors/user_api_client_error.dart';
import 'package:test_app_1/data/models/page_model.dart';
import 'package:test_app_1/data/models/user_model.dart';
import 'package:test_app_1/data/models/user_page_model.dart';

abstract class Configuration {
  static const String host = 'https://reqres.in/';
  static const String path = 'api/users';
  static const String pageParameter = 'page';
}

class UserApiClient {
  UserApiClient();

  Uri _createUri({required String path, Map<String, dynamic>? parameters}) {
    final uri = Uri.parse('${Configuration.host}$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<PageModel> fetchAllUsersPage({required int page}) async {
    try {
      final uri = _createUri(
        path: Configuration.path,
        parameters: <String, dynamic>{
          Configuration.pageParameter: page.toString(),
        },
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final result = PageModel.fromJson(json.decode(response.body));
        return result;
      } else {
        throw UserApiClientErrorUnableFetchAllUsersPage();
      }
    } on UserApiClientError {
      rethrow;
    } catch (exception) {
      throw UserApiClientErrorUnableFetchAllUsersPage();
    }
  }

  Future<UserModel> fetchUser({required int id}) async {
    try {
      final uri = _createUri(
        path: '${Configuration.path}/$id',
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final result = UserPageModel.fromJson(json.decode(response.body)).data;
        return result;
      } else {
        throw UserApiClientErrorUnableFetchUserPage();
      }
    } on UserApiClientError {
      rethrow;
    } catch (exception) {
      throw UserApiClientErrorUnableFetchUserPage();
    }
  }
}
