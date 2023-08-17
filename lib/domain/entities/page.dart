import 'package:test_app_1/data/models/page_model.dart';
import 'package:test_app_1/domain/entities/support.dart';
import 'package:test_app_1/domain/entities/user.dart';

class Page {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> data;
  Support support;

  Page({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory Page.fromPageModel({required PageModel pageModel}) => Page(
        page: pageModel.page,
        perPage: pageModel.perPage,
        total: pageModel.total,
        totalPages: pageModel.totalPages,
        data: pageModel.data
            .map((userModel) => User.fromUserModel(userModel: userModel))
            .toList(),
        support: Support.fromSupportModel(supportModel: pageModel.support),
      );
}
