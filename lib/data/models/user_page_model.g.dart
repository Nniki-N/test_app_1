// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPageModel _$UserPageModelFromJson(Map<String, dynamic> json) =>
    UserPageModel(
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
      support: SupportModel.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserPageModelToJson(UserPageModel instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'support': instance.support.toJson(),
    };
