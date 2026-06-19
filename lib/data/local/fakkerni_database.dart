import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'fakkerni_database.g.dart';

class ReminderEntities extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get originalTranscript => text().nullable()();

  DateTimeColumn get scheduledAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();

  IntColumn get typeIndex => integer()();

  IntColumn get statusIndex => integer()();

  TextColumn get recurrenceJson => text().nullable()();

  TextColumn get prayerAnchor => text().nullable()();

  IntColumn get snoozeMinutes => integer().withDefault(const Constant(10))();

  DateTimeColumn get updatedAt => dateTime()();

  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ReminderEvents extends Table {
  TextColumn get id => text()();

  TextColumn get reminderId => text().references(ReminderEntities, #id)();

  TextColumn get type => text()();

  DateTimeColumn get occurredAt => dateTime()();

  TextColumn get payloadJson => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AppSettings extends Table {
  TextColumn get key => text()();

  TextColumn get value => text()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

@DriftDatabase(tables: [ReminderEntities, ReminderEvents, AppSettings])
class FakkerniDatabase extends _$FakkerniDatabase {
  FakkerniDatabase({required this.sqlcipherKey})
    : super(_openConnection(sqlcipherKey));

  final String sqlcipherKey;

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
    },
  );
}

QueryExecutor _openConnection(String sqlcipherKey) {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'fakkerni.sqlite'));

    return NativeDatabase.createInBackground(
      file,
      setup: (database) {
        database.execute("PRAGMA key = '$sqlcipherKey';");
        database.execute('PRAGMA foreign_keys = ON;');
        database.execute('PRAGMA journal_mode = WAL;');
        database.execute('PRAGMA synchronous = NORMAL;');
      },
    );
  });
}

Map<String, dynamic> jsonMapFromString(String? rawJson) {
  if (rawJson == null || rawJson.isEmpty) {
    return <String, dynamic>{};
  }
  return jsonDecode(rawJson) as Map<String, dynamic>;
}

String jsonStringFromMap(Map<String, dynamic>? map) {
  if (map == null || map.isEmpty) {
    return '';
  }
  return jsonEncode(map);
}
