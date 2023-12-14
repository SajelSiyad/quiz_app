import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/model_freezed/questions/questions.dart';

class ApiService {
  Dio dio = Dio(
    BaseOptions(baseUrl: "https://nice-lime-hippo-wear.cyclic.app/"),
  );
  Future<List<Questions>?> getApiDatas() async {
    try {
      Response response = await dio.get("api/v1/quiz");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.data.length.toString());

        final dataslist = <Questions>[];
        for (final i in response.data) {
          print("object");
          dataslist.add(
            Questions.fromJson(i),
          );
        }
        log(dataslist.toString());
        return dataslist;
      }
    } catch (e) {
      Center(
        child: Text(e.toString()),
      );
    }
    return null;
  }
}
