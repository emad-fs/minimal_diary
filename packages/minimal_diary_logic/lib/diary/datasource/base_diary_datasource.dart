import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';

abstract class BaseDiaryDatasource {
  const BaseDiaryDatasource();

  Future<List<DiaryData>> fetchDiaryList();

  Future<void> storeDiary(DiaryCompanion diaryCompanion);

  Future<bool> updateDiary(DiaryCompanion diaryCompanion);

  Future<List<DiaryData>> queryDiaries(String queryString);

  Future<int> deleteDiary(DiaryData diaryData);
}
