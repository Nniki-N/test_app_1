import 'package:test_app_1/domain/entities/page.dart';
import 'package:test_app_1/domain/entities/user.dart';

abstract class UsersRepository {
  UsersRepository();

  Future<Page> fetchAllUsersPage({required int page});

  Future<User> fetchUser({required int id});
}
