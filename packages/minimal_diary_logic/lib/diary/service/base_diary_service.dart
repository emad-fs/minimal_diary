import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';

abstract class BaseDiaryService {
  const BaseDiaryService();

  Future<List<DiaryData>> getDiaryList();

  Future<void> saveDiary(DiaryCompanion diaryCompanion);

  Future<bool> editDiary(DiaryCompanion diaryCompanion);

  Future<List<DiaryData>> searchDiary(String queryString);
}
