import 'package:diu_student/core/resources/data_state.dart';
import 'package:diu_student/features/result%20analysis/domain/entities/semesterResultEntity.dart';

abstract interface class ResultRepo {
  Future<DataState<List<List<SemesterResultEntity>>>> getResult(String id);

  Future<DataState<List<SemesterResultEntity>>> getSemesterResult(
      String id, String semesterID);
}
