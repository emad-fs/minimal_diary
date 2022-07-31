import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:minimal_diary_logic/diary/datasource/base_diary_datasource.dart';

class CanvasDbDataSource extends BaseDiaryDatasource {
  @override
  Future<List<DiaryData>> fetchDiaryList() =>
      MyDatabase.instance.fetchCanvasList;

  @override
  Future<void> storeDiary(DiaryCompanion canvasCompanion) async {
    await MyDatabase.instance.insert(canvasCompanion);
  }
}
