import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:test_app_1/common/routes/argument_constants.dart';
import 'package:test_app_1/common/routes/app_routes.dart';
import 'package:test_app_1/domain/entities/user.dart';
import 'package:test_app_1/presentation/controllers/users/users_controller.dart';

class MainScreen extends GetView<UsersController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: controller.obx(
          (usersState) {
            if (usersState == null) {
              return NoUsersNotificationElementWithButton(controller: controller);
            }

            if (usersState.isEmpty) {
              return const Center(
                child: Text(
                  'There are no users',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              controller: controller.scroll,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    itemCount: usersState.length,
                    itemBuilder: (_, index) {
                      final user = usersState[index];

                      return UserItem(user: user);
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(height: 20);
                    },
                  ),
                  !controller.canLoadMorePages
                      ? const SizedBox.shrink()
                      : const CircularProgressIndicator(),
                  const SizedBox(height: 15)
                ],
              ),
            );
          },
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onError: (error) {
            return NoUsersNotificationElementWithButton(controller: controller);
          },
        ),
      ),
    );
  }
}

class NoUsersNotificationElementWithButton extends StatelessWidget {
  const NoUsersNotificationElementWithButton({
    super.key,
    required this.controller,
  });

  final UsersController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Can not load users',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              controller.loadUsers();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
            ),
            child: const Text(
              'Try again',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.userInfo,
          arguments: {
            ArgumentConstants.id: user.id,
          },
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: user.avatar,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  return CircularProgressIndicator(
                    value: progress.progress,
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[400],
                  );
                },
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  user.email,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
