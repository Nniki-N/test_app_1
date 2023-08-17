import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_1/common/typedefs.dart';
import 'package:test_app_1/data/models/schemas/page_schema.dart';
import 'package:test_app_1/data/models/support_model.dart';
import 'package:test_app_1/data/models/user_model.dart';

part 'page_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PageModel {
  @JsonKey(name: PageSchema.page)
  int page;
  @JsonKey(name: PageSchema.perPage)
  int perPage;
  @JsonKey(name: PageSchema.total)
  int total;
  @JsonKey(name: PageSchema.totalPages)
  int totalPages;
  @JsonKey(name: PageSchema.data)
  List<UserModel> data;
  @JsonKey(name: PageSchema.support)
  SupportModel support;

  PageModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  // factory PageModel.fromJson({required Json json}) => PageModel(
  //       page: json[PageSchema.page],
  //       perPage: json[PageSchema.perPage],
  //       total: json[PageSchema.total],
  //       totalPages: json[PageSchema.totalPages],
  //       data: (json[PageSchema.data] as List<dynamic>)
  //           .map((e) => UserModel.fromJson(json: e as Json))
  //           .toList(),
  //       support: SupportModel.fromJson(json: json[PageSchema.support]),
  //     );

  // Json toJson() => {
  //       PageSchema.page: page,
  //       PageSchema.perPage: perPage,
  //       PageSchema.total: total,
  //       PageSchema.totalPages: totalPages,
  //       PageSchema.data: data.map((userModel) => userModel.toJson()).toList(),
  //       PageSchema.support: support.toJson(),
  //     };

  factory PageModel.fromJson(Json json) => _$PageModelFromJson(json);
  Json toJson() => _$PageModelToJson(this);
}
