import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_diary/core/diary/controller/diary_controller.dart';
import 'package:minimal_diary/features/add_diary/presentation/add_diary_page.dart';

class DiaryListPage extends StatefulWidget {
  const DiaryListPage({Key? key}) : super(key: key);

  @override
  State<DiaryListPage> createState() => _DiaryListPageState();
}

class _DiaryListPageState extends State<DiaryListPage> {
  late DiaryController _diaryController;

  @override
  void initState() {
    super.initState();
    _diaryController = Get.find<DiaryController>();
    _diaryController.getDiaryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildDiaryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddDiaryPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDiaryList() => Obx(
          () => ListView.builder(
            itemCount: _diaryController.diaries.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(_diaryController.diaries[index].title ?? ''),
            ),
          ),
        );
}
