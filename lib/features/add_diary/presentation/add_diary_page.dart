import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_diary/core/diary/controller/diary_controller.dart';
import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:theme_provider/text_styles.dart';
import 'package:theme_provider/theme_provider.dart';

class AddDiaryPage extends StatefulWidget {
  static const String routeName = '/addDiary';

  const AddDiaryPage({Key? key}) : super(key: key);

  @override
  State<AddDiaryPage> createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  late DiaryController _diaryController;
  late TextEditingController _titleController;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _textController = TextEditingController();

    _diaryController = Get.find<DiaryController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAddDiaryPage(),
    );
  }

  Widget _buildAddDiaryPage() => SafeArea(
        child: Scaffold(
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: ThemeProvider.margin08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  style: TextStyles.body1Bold,
                  decoration: InputDecoration(
                    hintText: 'title',
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    style: TextStyles.body1,
                    enabled: true,
                    expands: true,
                    maxLines: null,
                    autocorrect: false,
                    decoration: InputDecoration(
                      /*enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                            style: BorderStyle.solid),
                      ),*/
                      hintText: 'how was your day...',
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (!_titleController.value.text.isEmpty &&
                  !_textController.text.isEmpty) {
                await _saveDiary();
                print('saved');
                Get.back();
              }
            },
            child: Icon(Icons.done),
          ),
        ),
      );

  Future<void> _saveDiary() async {
    DiaryCompanion currentDiary = DiaryCompanion(
        title: drift.Value<String>(_titleController.value.text),
        diary: drift.Value<String>(_textController.value.text),
        userId: drift.Value<int>(1),
        date: drift.Value<DateTime>(DateTime.now()));
    await _diaryController.saveDiary(currentDiary);
  }
}
