import 'package:flutter/material.dart';
import 'package:minimal_diary/features/diary_list/presentation/widgets/diary_list_item.dart';
import 'package:minimal_diary_logic/database/model/diary/diary_model.dart';
import 'package:theme_provider/theme_provider.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({
    required this.items,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final List<DiaryData> items;

  final void Function(DiaryData)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
      child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) => DiaryListItem(
              title: items[index].title ?? '',
              date: items[index].date.toString(),
              onTap: (){
                onTap?.call(items[index]);
              },
            ),
          ),
    );
  }
}
