import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/models/model_freezed/options/option.dart';
part 'questions.freezed.dart';

@freezed
class Questions with _$Questions {
  factory Questions(
      {required String id,
      required String question,
      required List<OptionsDatas> option}) = _Questions;
}
