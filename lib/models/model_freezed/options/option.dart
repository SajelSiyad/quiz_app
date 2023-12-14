import 'package:freezed_annotation/freezed_annotation.dart';
part 'option.freezed.dart';

@freezed
class OptionsDatas with _$OptionsDatas {
  factory OptionsDatas({
    required String text,
    required bool isCorrect,
  }) = _OptionsDatas;
}
