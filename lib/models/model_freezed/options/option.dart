import 'package:freezed_annotation/freezed_annotation.dart';
part 'option.freezed.dart';
part 'option.g.dart';

@freezed
class OptionsDatas with _$OptionsDatas {
  factory OptionsDatas({
    required String text,
    required bool isCorrect,
  }) = _OptionsDatas;
  factory OptionsDatas.fromJson(Map<String, Object?> json) =>
      _$OptionsDatasFromJson(json);
}
