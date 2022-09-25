import 'package:flutter/material.dart';
import 'package:minimal_diary/core/helpers/index.dart';
import 'package:theme_provider/text_styles.dart';
import 'package:theme_provider/theme_provider.dart';

class DiaryListItem extends StatelessWidget {
  const DiaryListItem({
    required this.title,
    required this.date,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;

  final DateTime date;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: ThemeProvider.margin08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyles.body1.copyWith(fontSize: 17)),
              Text(
                getFormattedDate(date),
                style: TextStyles.overline.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
