import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_1/common/typedefs.dart';
import 'package:test_app_1/data/models/schemas/user_schema.dart';
import 'package:test_app_1/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: UserSchema.id)
  int id;
  @JsonKey(name: UserSchema.email)
  String email;
  @JsonKey(name: UserSchema.firstName)
  String firstName;
  @JsonKey(name: UserSchema.lastName)
  String lastName;
  @JsonKey(name: UserSchema.avatar)
  String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  // factory UserModel.fromJson({required Json json}) => UserModel(
  //       id: json[UserSchema.id],
  //       email: json[UserSchema.email],
  //       firstName: json[UserSchema.firstName],
  //       lastName: json[UserSchema.lastName],
  //       avatar: json[UserSchema.avatar],
  //     );

  // Json toJson() => {
  //       UserSchema.id: id,
  //       UserSchema.email: email,
  //       UserSchema.firstName: firstName,
  //       UserSchema.lastName: lastName,
  //       UserSchema.avatar: avatar,
  //     };

  factory UserModel.fromJson(Json json) => _$UserModelFromJson(json);

  Json toJson() => _$UserModelToJson(this);

  factory UserModel.fromUserModel({required User user}) => UserModel(
        id: user.id,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        avatar: user.avatar,
      );
}
