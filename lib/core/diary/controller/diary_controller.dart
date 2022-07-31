import 'package:get/get.dart';
import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:minimal_diary_logic/diary/service/base_canvas_service.dart';

class CanvasController extends GetxController {
  CanvasController(this.diaryService);

  RxList<DiaryData> canvases = <DiaryData>[].obs;

  final BaseDiaryService diaryService;

  Future<void> getDiaryList() async {
    canvases.value = await diaryService.getDiaryList();
  }

  Future<void> saveDiary(DiaryCompanion diaryCompanion) async {
    await diaryService.saveDiary(diaryCompanion);
    canvases.value = await diaryService.getDiaryList();
  }
}
