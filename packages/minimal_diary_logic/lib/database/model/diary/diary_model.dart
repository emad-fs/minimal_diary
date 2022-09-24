import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'diary_model.g.dart';

class Diary extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer()();

  TextColumn get title => text().nullable()();

  TextColumn get diary => text().nullable()();

  DateTimeColumn get date => dateTime()();
}

@DriftDatabase(tables: [Diary])
class MyDatabase extends _$MyDatabase {
  MyDatabase._internal() : super(_openConnection());

  static final MyDatabase _instance = MyDatabase._internal();

  static MyDatabase get instance => _instance;

  Future<int> insertDiary(DiaryCompanion diaryCompanion) =>
      into(diary).insert(diaryCompanion);

  Future<List<DiaryData>> get fetchCanvasList => select(diary).get();

  Future<bool> updateDiary(DiaryCompanion diaryCompanion) {
    return update(diary).replace(diaryCompanion);
  }

  Future<DiaryData> getSingleDiaryById(int id) {
    return (select(diary)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<DiaryData>> searchQuery(String queryString){
    return (select(diary)..where((tbl) => tbl.title.contains(queryString))).get();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final Directory dbFolder = await getApplicationDocumentsDirectory();
      final File file = File(p.join(dbFolder.path, 'minimal_diary_db.sqlite'));
      return NativeDatabase(file);
    });
