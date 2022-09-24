import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_diary/core/diary/controller/diary_controller.dart';
import 'package:minimal_diary/features/add_diary/presentation/add_diary_page.dart';
import 'package:minimal_diary/features/diary_list/presentation/widgets/diary_list.dart';
import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';


class MainSearchDelegate extends SearchDelegate {

  MainSearchDelegate() : super(searchFieldDecorationTheme: InputDecorationTheme(
   border: InputBorder.none
  ));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<DiaryData>>(
      future: Get.find<DiaryController>().searchDiaries(query),
      builder: (context,snapshot){
        return DiaryList(
          items: snapshot.data ?? [],
          onTap: (diaryData) => Get.to(AddDiaryPage(diary: diaryData)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => SizedBox.shrink();

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context).copyWith(
      appBarTheme: super.appBarTheme(context).appBarTheme.copyWith(
        elevation: 0.0,
      ),
    );
  }
}
