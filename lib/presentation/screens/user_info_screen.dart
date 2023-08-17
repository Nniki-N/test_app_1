import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_1/domain/entities/user.dart';
import 'package:test_app_1/presentation/controllers/user_info/user_info_controller.dart';

class UserInfoScreen extends GetView<UserInfoController> {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 75,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: controller.obx(
            (userInfoState) {
              if (userInfoState == null) {
                return const Text(
                  'Can not load user',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }

              return UserInfo(user: userInfoState);
            },
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            onError: (error) => const Text(
              'Can not load user',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: user.avatar,
            width: 180,
            height: 180,
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
        const SizedBox(height: 20),
        Text(
          'Id: ${user.id}',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${user.firstName} ${user.lastName}',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Email: ${user.email}',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
          ),
          child: const Text(
            'Back',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
