import 'package:dio/dio.dart';
import 'package:diu_student/core/resources/data_state.dart';
import 'package:diu_student/features/result%20analysis/data/model/semesterModel.dart';
import 'package:diu_student/features/result%20analysis/data/model/semesterResultModel.dart';

import '../../../../../core/links/api_links.dart';

final dio = Dio();

abstract interface class RemoteResult {
  Future<DataState<List<SemesterResultModel>>> getResult({
    required String studentId,
    required String semesterId,
  });
}

abstract class RemoteSemesters {
  Future<DataState<List<SemesterModel>>> getSemesters();
}

class RemoteSemestersImpl implements RemoteSemesters {
  @override
  Future<DataState<List<SemesterModel>>> getSemesters() async {
    try {
      final response = await dio.get("$result_api/semesterList");
      List<SemesterModel> semesterModels = [];

      if (response.statusCode == 200) {
        final semesters = response.data;
        for (Map<String, dynamic> semester in semesters) {
          semesterModels.add(SemesterModel.fromJson(semester));
        }
        return DataSuccess(semesterModels);
      } else {
        return DataFailed(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return DataFailed(e.message.toString());
    }
  }
}

class RemoteResultImpl implements RemoteResult {
  @override
  Future<DataState<List<SemesterResultModel>>> getResult(
      {required String semesterId, required String studentId}) async {
    try {
      final response = await dio.get(
          "$result_api?grecaptcha=&semesterId=$semesterId&studentId=$studentId");

      if (response.statusCode == 200) {
        List<SemesterResultModel> semesterResult = [];

        final result = response.data;
        if (result.runtimeType == List<dynamic>) {
          for (Map<String, dynamic> courseResult in result) {
            semesterResult.add(SemesterResultModel.fromJson(courseResult));
          }
        }
        return DataSuccess(semesterResult);
      } else {
        return DataFailed(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return DataFailed(e.message.toString());
    }
  }
}
