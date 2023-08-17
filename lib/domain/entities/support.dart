import 'package:test_app_1/data/models/support_model.dart';

class Support {
  String url;
  String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromSupportModel({required SupportModel supportModel}) =>
      Support(
        url: supportModel.url,
        text: supportModel.text,
      );
}
