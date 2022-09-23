import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:minimal_diary_logic/diary/datasource/base_diary_datasource.dart';

class DiaryDbDataSource extends BaseDiaryDatasource {
  @override
  Future<List<DiaryData>> fetchDiaryList() =>
      MyDatabase.instance.fetchCanvasList;

  @override
  Future<void> storeDiary(DiaryCompanion diaryCompanion) async {
    await MyDatabase.instance.insertDiary(diaryCompanion);
  }

  @override
  Future<bool> updateDiary(DiaryCompanion diaryCompanion) async{
    return await MyDatabase.instance.updateDiary(diaryCompanion);
  }
}
