import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_diary/core/diary/controller/diary_controller.dart';
import 'package:minimal_diary/core/extensions/index.dart';
import 'package:minimal_diary/features/add_diary/presentation/add_diary_page.dart';
import 'package:minimal_diary/features/diary_list/presentation/widgets/diary_list_item.dart';
import 'package:minimal_diary/features/diary_list/presentation/widgets/main_search_delegate.dart';
import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
        title: GestureDetector(child: Text(context.localization.labelMinimalDiary),
          onTap: ()=> _showAbout(context),
        ),
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
              onLongPress: () => _showRemoveItemBottomSheet(
                  context, _diaryController.diaries[index]),
            ),
          ),
        ),
      );

  void _showRemoveItemBottomSheet(BuildContext context, DiaryData diaryData) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text(context.localization.labelRemoveDiary),
                  onTap: () {
                    Navigator.of(context).pop();
                    _showVerificationDialog(context, diaryData);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _showVerificationDialog(BuildContext context, DiaryData diaryData) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(context.localization.labelAreYouSure),
            actions: [
              TextButton(
                  child: Text(context.localization.labelYes),
                  onPressed: () {
                    _removeDiary(diaryData);
                    Navigator.of(context).pop();
                  }),
              TextButton(
                  child: Text(context.localization.labelNo),
                  onPressed: () => Navigator.of(context).pop())
            ],
          );
        });
  }

  Future<void> _removeDiary(DiaryData diaryData) async {
    return await _diaryController.removeDiary(diaryData);
  }

  Future<void> _showAbout(BuildContext context) async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    await showDialog<String>(context: context, builder: (BuildContext context) {
      return AlertDialog(
        content: ListView(
          shrinkWrap: true,

          children: [
            Center(child: Text(context.localization.labelMinimalDiary,style: TextStyles.lightTitle,)),
            Center(child: Text('${context.localization.labelVersion}: ${packageInfo.version}',style: TextStyles.caption,)),
          ],
        ),
        actions: [
          TextButton(
              child: Text(context.localization.labelClose),
              onPressed: () => Navigator.of(context).pop()),
        ],
      );
    });
  }
}
