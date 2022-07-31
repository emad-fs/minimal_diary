// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DiaryData extends DataClass implements Insertable<DiaryData> {
  final int id;
  final int userId;
  final String? title;
  final String? diary;
  final DateTime date;
  DiaryData(
      {required this.id,
      required this.userId,
      this.title,
      this.diary,
      required this.date});
  factory DiaryData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DiaryData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      diary: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}diary']),
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || diary != null) {
      map['diary'] = Variable<String?>(diary);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  DiaryCompanion toCompanion(bool nullToAbsent) {
    return DiaryCompanion(
      id: Value(id),
      userId: Value(userId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      diary:
          diary == null && nullToAbsent ? const Value.absent() : Value(diary),
      date: Value(date),
    );
  }

  factory DiaryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaryData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String?>(json['title']),
      diary: serializer.fromJson<String?>(json['diary']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String?>(title),
      'diary': serializer.toJson<String?>(diary),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  DiaryData copyWith(
          {int? id,
          int? userId,
          String? title,
          String? diary,
          DateTime? date}) =>
      DiaryData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        diary: diary ?? this.diary,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('DiaryData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('diary: $diary, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, title, diary, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaryData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.diary == this.diary &&
          other.date == this.date);
}

class DiaryCompanion extends UpdateCompanion<DiaryData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String?> title;
  final Value<String?> diary;
  final Value<DateTime> date;
  const DiaryCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.diary = const Value.absent(),
    this.date = const Value.absent(),
  });
  DiaryCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.title = const Value.absent(),
    this.diary = const Value.absent(),
    required DateTime date,
  })  : userId = Value(userId),
        date = Value(date);
  static Insertable<DiaryData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String?>? title,
    Expression<String?>? diary,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (diary != null) 'diary': diary,
      if (date != null) 'date': date,
    });
  }

  DiaryCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String?>? title,
      Value<String?>? diary,
      Value<DateTime>? date}) {
    return DiaryCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      diary: diary ?? this.diary,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (diary.present) {
      map['diary'] = Variable<String?>(diary.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('diary: $diary, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $DiaryTable extends Diary with TableInfo<$DiaryTable, DiaryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaryTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _diaryMeta = const VerificationMeta('diary');
  @override
  late final GeneratedColumn<String?> diary = GeneratedColumn<String?>(
      'diary', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, title, diary, date];
  @override
  String get aliasedName => _alias ?? 'diary';
  @override
  String get actualTableName => 'diary';
  @override
  VerificationContext validateIntegrity(Insertable<DiaryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('diary')) {
      context.handle(
          _diaryMeta, diary.isAcceptableOrUnknown(data['diary']!, _diaryMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DiaryData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DiaryTable createAlias(String alias) {
    return $DiaryTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DiaryTable diary = $DiaryTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [diary];
}
