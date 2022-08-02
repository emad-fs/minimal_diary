import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_diary/core/diary/controller/diary_controller.dart';
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
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeProvider.margin08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'title'
            ),
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              enabled: true,
              expands: true,
              maxLines: null,
              autocorrect: false,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 3.0,
                      style: BorderStyle.solid
                  ),
                ),

                hintText: 'how was your day...',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
