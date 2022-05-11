import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_model.freezed.dart';
part 'page_model.g.dart';

@freezed
class PageModel with _$PageModel {
  factory PageModel({int? userId, int? id, String? title, String? body}) =
      _PageModel;

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      _$PageModelFromJson(json);
}
