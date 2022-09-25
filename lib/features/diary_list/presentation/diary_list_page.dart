import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_diary/core/diary/controller/diary_controller.dart';
import 'package:minimal_diary/core/extensions/index.dart';
import 'package:minimal_diary/features/add_diary/presentation/add_diary_page.dart';
import 'package:minimal_diary/features/diary_list/presentation/widgets/diary_list_item.dart';
import 'package:minimal_diary/features/diary_list/presentation/widgets/main_search_delegate.dart';
import 'package:theme_provider/text_styles.dart';
import 'package:theme_provider/theme_provider.dart';

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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(context.localization.labelMinimalDiary),
        titleTextStyle: TextStyles.lightTitle.copyWith(color: Colors.grey),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MainSearchDelegate());
            },
          )
        ],
      ),
      body: _buildDiaryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddDiaryPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDiaryList() => Padding(
        padding: EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
        child: Obx(
          () => ListView.builder(
            itemCount: _diaryController.diaries.length,
            itemBuilder: (BuildContext context, int index) => DiaryListItem(
              title: _diaryController.diaries[index].title ?? '',
              date: _diaryController.diaries[index].date,
              onTap: () {
                Get.to(
                  AddDiaryPage(
                    diary: _diaryController.diaries[index],
                  ),
                );
              },
            ),
          ),
        ),
      );
}
