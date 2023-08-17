import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_1/common/typedefs.dart';
import 'package:test_app_1/data/models/schemas/page_schema.dart';
import 'package:test_app_1/data/models/support_model.dart';
import 'package:test_app_1/data/models/user_model.dart';

part 'user_page_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserPageModel {
  @JsonKey(name: PageSchema.data)
  UserModel data;
  @JsonKey(name: PageSchema.support)
  SupportModel support;

  UserPageModel({
    required this.data,
    required this.support,
  });

  // factory UserPageModel.fromJson({required Json json}) => UserPageModel(
  //       data: UserModel.fromJson(json: json[PageSchema.data]),
  //       support: SupportModel.fromJson(json: json[PageSchema.support]),
  //     );

  factory UserPageModel.fromJson(Json json) => _$UserPageModelFromJson(json);
  Json toJson() => _$UserPageModelToJson(this);
}
