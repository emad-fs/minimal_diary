import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:minimal_diary_logic/diary/datasource/base_diary_datasource.dart';
import 'package:minimal_diary_logic/diary/service/base_diary_service.dart';

class DiaryService extends BaseDiaryService {
  DiaryService(this.diaryDatasource);

  final BaseDiaryDatasource diaryDatasource;

  @override
  Future<List<DiaryData>> getDiaryList() async {
    try {
      final List<DiaryData> canvasList = await diaryDatasource.fetchDiaryList();
      return canvasList;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveDiary(DiaryCompanion diaryCompanion) async {
    try {
      await diaryDatasource.storeDiary(diaryCompanion);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> editDiary(DiaryCompanion diaryCompanion) async{
    try {
      return await diaryDatasource.updateDiary(diaryCompanion);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<DiaryData>> searchDiary(String queryString) async{
    try {
      return await diaryDatasource.queryDiaries(queryString);
    } on Exception {
      rethrow;
    }
  }
}
