import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/models/model_freezed/options/option.dart';
part 'questions.freezed.dart';
part 'questions.g.dart';

@freezed
class Questions with _$Questions {
  factory Questions(
      {required String question,
      required List<OptionsDatas> options}) = _Questions;
  factory Questions.fromJson(Map<String, Object?> json) =>
      _$QuestionsFromJson(json);
}
