import 'package:get/get.dart';
import 'package:test_app_1/domain/entities/user.dart';
import 'package:test_app_1/domain/repositories/users_repository.dart';

class UsersController extends GetxController
    with StateMixin<List<User>>, ScrollMixin {
  final UsersRepository _usersRepository;

  int _page = 1;
  bool canLoadMorePages = true;

  UsersController({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  @override
  void onInit() {
    super.onInit();

    loadUsers();
  }

  Future<void> loadUsers() async {
    try {
      if (!canLoadMorePages) return;

      final page = await _usersRepository.fetchAllUsersPage(page: _page);
      final newState = state;

      if (newState != null) {
        newState.addAll(page.data);

        change(newState, status: RxStatus.success());
      } else {
        change(page.data, status: RxStatus.success());
      }

      if (page.totalPages == _page) {
        canLoadMorePages = false;
        return;
      }
    } catch (exeption) {
      change(null, status: RxStatus.error());
    }
  }

  @override
  Future<void> onEndScroll() async {
    if (canLoadMorePages) {
      _page++;

      await loadUsers();
    }
  }

  @override
  Future<void> onTopScroll() async {}
}
