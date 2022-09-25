import 'package:get/get.dart';
import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:minimal_diary_logic/diary/service/base_diary_service.dart';

class DiaryController extends GetxController with StateMixin<List<DiaryData>>{
  DiaryController(this.diaryService);

  RxList<DiaryData> diaries = <DiaryData>[].obs;

  final BaseDiaryService diaryService;

  Future<void> getDiaryList() async {
    List<DiaryData> data = await diaryService.getDiaryList();
    diaries.value = data;
  }

  Future<void> saveDiary(DiaryCompanion diaryCompanion) async {
    await diaryService.saveDiary(diaryCompanion);
    diaries.value = await diaryService.getDiaryList();
  }

  Future<void> editDiary(DiaryCompanion diaryCompanion) async {
    await diaryService.editDiary(diaryCompanion);
    diaries.value = await diaryService.getDiaryList();
  }

  Future<List<DiaryData>> searchDiaries(String queryString){
    return diaryService.searchDiary(queryString);
  }

  Future<void> removeDiary(DiaryData diaryData) async{
     await diaryService.removeDiary(diaryData);
     diaries.value = await diaryService.getDiaryList();
  }
}
