import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:minimal_diary/core/diary/controller/diary_controller.dart';
import 'package:minimal_diary/features/add_diary/presentation/add_diary_page.dart';
import 'package:minimal_diary/features/diary_list/presentation/diary_list_page.dart';
import 'package:minimal_diary/generated/l10n.dart';
import 'package:minimal_diary_logic/diary/datasource/diary_db_datasource.dart';
import 'package:minimal_diary_logic/diary/service/diary_service.dart';

void main() {
  _initializeControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage<dynamic>(
          name: AddDiaryPage.routeName,
          page: () => const AddDiaryPage(),
        ),
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lime,
        scaffoldBackgroundColor: Colors.white
      ),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: DiaryListPage(),
    );
  }
}

void _initializeControllers() {
  Get.put(
    DiaryController(
      DiaryService(
        DiaryDbDataSource(),
      ),
    ),
  );
}
