import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_diary/core/diary/controller/diary_controller.dart';
import 'package:minimal_diary/core/extensions/index.dart';
import 'package:minimal_diary/core/helpers/index.dart';
import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:theme_provider/text_styles.dart';
import 'package:theme_provider/theme_provider.dart';

class AddDiaryPage extends StatefulWidget {
  static const String routeName = '/addDiary';

  const AddDiaryPage({this.diary, Key? key}) : super(key: key);

  final DiaryData? diary;

  @override
  State<AddDiaryPage> createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  late DiaryController _diaryController;
  late TextEditingController _titleController;
  late TextEditingController _textController;
  DiaryData? _diaryData;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _textController = TextEditingController();

    _diaryController = Get.find<DiaryController>();
    _diaryData = widget.diary;

    _initializeDiaryData(_diaryData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAddDiaryPage(),
    );
  }

  Widget _buildAddDiaryPage() => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_sharp),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await _saveDiary();
                Navigator.pop(context);
              },
              icon: Icon(Icons.done),
            )
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _titleController,
                style: TextStyles.lightTitle.copyWith(fontSize: 22),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: context.localization.hintTitle,
                ),
              ),
              if (isDateVisible())
                Column(
                  children: [
                    Text(
                      getFormattedDate(_diaryData!.date),
                      style: TextStyles.overline.copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: ThemeProvider.margin08)
                  ],
                ),
              Expanded(
                child: TextField(
                  controller: _textController,
                  style: TextStyles.body1Light.copyWith(fontSize: 17),
                  enabled: true,
                  expands: true,
                  maxLines: null,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: context.localization.hintHowWasYourDay,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Future<void> _saveDiary() async {
    DiaryCompanion currentDiary = DiaryCompanion(
        id: _diaryData != null
            ? drift.Value<int>(_diaryData!.id)
            : drift.Value.absent(),
        title: drift.Value<String>(_titleController.value.text),
        diary: drift.Value<String>(_textController.value.text),
        userId: drift.Value<int>(1),
        date: drift.Value<DateTime>(DateTime.now()));
    if (_diaryData != null) {
      await _diaryController.editDiary(currentDiary);
    } else
      await _diaryController.saveDiary(currentDiary);
  }

  void _initializeDiaryData(DiaryData? diaryData) {
    if (_diaryData != null) {
      _titleController.text = _diaryData?.title ?? '';
      _textController.text = _diaryData?.diary ?? '';
    }
  }

  bool isDateVisible() => _diaryData != null;
}
