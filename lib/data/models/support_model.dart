import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_1/common/typedefs.dart';
import 'package:test_app_1/data/models/schemas/support_schema.dart';

part 'support_model.g.dart';

@JsonSerializable()
class SupportModel {
  @JsonKey(name: SupportSchema.url)
  String url;
  @JsonKey(name: SupportSchema.text)
  String text;

  SupportModel({
    required this.url,
    required this.text,
  });

  // factory SupportModel.fromJson({required Json json}) => SupportModel(
  //       url: json[SupportSchema.url],
  //       text: json[SupportSchema.text],
  //     );

  // Json toJson() => {
  //       SupportSchema.url: url,
  //       SupportSchema.text: text,
  //     };

  factory SupportModel.fromJson(Json json) =>
      _$SupportModelFromJson(json);

  Json toJson() => _$SupportModelToJson(this);
}
