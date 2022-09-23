import 'package:get/get.dart';
import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:minimal_diary_logic/diary/service/base_diary_service.dart';

class DiaryController extends GetxController {
  DiaryController(this.diaryService);

  RxList<DiaryData> diaries = <DiaryData>[].obs;

  final BaseDiaryService diaryService;

  Future<void> getDiaryList() async {
    diaries.value = await diaryService.getDiaryList();
  }

  Future<void> saveDiary(DiaryCompanion diaryCompanion) async {
    await diaryService.saveDiary(diaryCompanion);
    diaries.value = await diaryService.getDiaryList();
  }

  Future<void> editDiary(DiaryCompanion diaryCompanion) async {
    await diaryService.editDiary(diaryCompanion);
    diaries.value = await diaryService.getDiaryList();
  }
}
