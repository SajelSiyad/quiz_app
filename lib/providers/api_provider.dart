import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/services/api_service.dart';
import 'package:quiz_app/models/model_freezed/questions/questions.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final getDataProvider = FutureProvider<List<Questions>?>((ref) async {
  return ref.watch(apiServiceProvider).getApiDatas();
});
