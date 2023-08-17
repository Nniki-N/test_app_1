import 'package:get/get.dart';
import 'package:test_app_1/domain/entities/user.dart';
import 'package:test_app_1/domain/repositories/users_repository.dart';

class UserInfoController extends GetxController with StateMixin<User> {
  final UsersRepository _usersRepository;
  final int _userId;

  UserInfoController({
    required int userId,
    required UsersRepository usersRepository,
  })  : _userId = userId,
        _usersRepository = usersRepository;

  @override
  void onInit() {
    super.onInit();

    _loadUser(id: _userId);
  }

  Future<void> _loadUser({required int id}) async {
    try {
      final user = await _usersRepository.fetchUser(id: id);

      change(user, status: RxStatus.success());
    } catch (exeption) {
      change(null, status: RxStatus.error());
    }
  }
}
