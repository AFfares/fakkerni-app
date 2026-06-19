// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fakkerni_database.dart';

// ignore_for_file: type=lint
class $ReminderEntitiesTable extends ReminderEntities
    with TableInfo<$ReminderEntitiesTable, ReminderEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalTranscriptMeta =
      const VerificationMeta('originalTranscript');
  @override
  late final GeneratedColumn<String> originalTranscript =
      GeneratedColumn<String>(
        'original_transcript',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeIndexMeta = const VerificationMeta(
    'typeIndex',
  );
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
    'type_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusIndexMeta = const VerificationMeta(
    'statusIndex',
  );
  @override
  late final GeneratedColumn<int> statusIndex = GeneratedColumn<int>(
    'status_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recurrenceJsonMeta = const VerificationMeta(
    'recurrenceJson',
  );
  @override
  late final GeneratedColumn<String> recurrenceJson = GeneratedColumn<String>(
    'recurrence_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prayerAnchorMeta = const VerificationMeta(
    'prayerAnchor',
  );
  @override
  late final GeneratedColumn<String> prayerAnchor = GeneratedColumn<String>(
    'prayer_anchor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _snoozeMinutesMeta = const VerificationMeta(
    'snoozeMinutes',
  );
  @override
  late final GeneratedColumn<int> snoozeMinutes = GeneratedColumn<int>(
    'snooze_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    originalTranscript,
    scheduledAt,
    createdAt,
    typeIndex,
    statusIndex,
    recurrenceJson,
    prayerAnchor,
    snoozeMinutes,
    updatedAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_entities';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('original_transcript')) {
      context.handle(
        _originalTranscriptMeta,
        originalTranscript.isAcceptableOrUnknown(
          data['original_transcript']!,
          _originalTranscriptMeta,
        ),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(
        _typeIndexMeta,
        typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('status_index')) {
      context.handle(
        _statusIndexMeta,
        statusIndex.isAcceptableOrUnknown(
          data['status_index']!,
          _statusIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_statusIndexMeta);
    }
    if (data.containsKey('recurrence_json')) {
      context.handle(
        _recurrenceJsonMeta,
        recurrenceJson.isAcceptableOrUnknown(
          data['recurrence_json']!,
          _recurrenceJsonMeta,
        ),
      );
    }
    if (data.containsKey('prayer_anchor')) {
      context.handle(
        _prayerAnchorMeta,
        prayerAnchor.isAcceptableOrUnknown(
          data['prayer_anchor']!,
          _prayerAnchorMeta,
        ),
      );
    }
    if (data.containsKey('snooze_minutes')) {
      context.handle(
        _snoozeMinutesMeta,
        snoozeMinutes.isAcceptableOrUnknown(
          data['snooze_minutes']!,
          _snoozeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      originalTranscript: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_transcript'],
      ),
      scheduledAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}scheduled_at'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      typeIndex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}type_index'],
          )!,
      statusIndex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}status_index'],
          )!,
      recurrenceJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence_json'],
      ),
      prayerAnchor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prayer_anchor'],
      ),
      snoozeMinutes:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}snooze_minutes'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $ReminderEntitiesTable createAlias(String alias) {
    return $ReminderEntitiesTable(attachedDatabase, alias);
  }
}

class ReminderEntity extends DataClass implements Insertable<ReminderEntity> {
  final String id;
  final String title;
  final String? originalTranscript;
  final DateTime scheduledAt;
  final DateTime createdAt;
  final int typeIndex;
  final int statusIndex;
  final String? recurrenceJson;
  final String? prayerAnchor;
  final int snoozeMinutes;
  final DateTime updatedAt;
  final DateTime? completedAt;
  const ReminderEntity({
    required this.id,
    required this.title,
    this.originalTranscript,
    required this.scheduledAt,
    required this.createdAt,
    required this.typeIndex,
    required this.statusIndex,
    this.recurrenceJson,
    this.prayerAnchor,
    required this.snoozeMinutes,
    required this.updatedAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || originalTranscript != null) {
      map['original_transcript'] = Variable<String>(originalTranscript);
    }
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['type_index'] = Variable<int>(typeIndex);
    map['status_index'] = Variable<int>(statusIndex);
    if (!nullToAbsent || recurrenceJson != null) {
      map['recurrence_json'] = Variable<String>(recurrenceJson);
    }
    if (!nullToAbsent || prayerAnchor != null) {
      map['prayer_anchor'] = Variable<String>(prayerAnchor);
    }
    map['snooze_minutes'] = Variable<int>(snoozeMinutes);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  ReminderEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ReminderEntitiesCompanion(
      id: Value(id),
      title: Value(title),
      originalTranscript:
          originalTranscript == null && nullToAbsent
              ? const Value.absent()
              : Value(originalTranscript),
      scheduledAt: Value(scheduledAt),
      createdAt: Value(createdAt),
      typeIndex: Value(typeIndex),
      statusIndex: Value(statusIndex),
      recurrenceJson:
          recurrenceJson == null && nullToAbsent
              ? const Value.absent()
              : Value(recurrenceJson),
      prayerAnchor:
          prayerAnchor == null && nullToAbsent
              ? const Value.absent()
              : Value(prayerAnchor),
      snoozeMinutes: Value(snoozeMinutes),
      updatedAt: Value(updatedAt),
      completedAt:
          completedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(completedAt),
    );
  }

  factory ReminderEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderEntity(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      originalTranscript: serializer.fromJson<String?>(
        json['originalTranscript'],
      ),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      statusIndex: serializer.fromJson<int>(json['statusIndex']),
      recurrenceJson: serializer.fromJson<String?>(json['recurrenceJson']),
      prayerAnchor: serializer.fromJson<String?>(json['prayerAnchor']),
      snoozeMinutes: serializer.fromJson<int>(json['snoozeMinutes']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'originalTranscript': serializer.toJson<String?>(originalTranscript),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'statusIndex': serializer.toJson<int>(statusIndex),
      'recurrenceJson': serializer.toJson<String?>(recurrenceJson),
      'prayerAnchor': serializer.toJson<String?>(prayerAnchor),
      'snoozeMinutes': serializer.toJson<int>(snoozeMinutes),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  ReminderEntity copyWith({
    String? id,
    String? title,
    Value<String?> originalTranscript = const Value.absent(),
    DateTime? scheduledAt,
    DateTime? createdAt,
    int? typeIndex,
    int? statusIndex,
    Value<String?> recurrenceJson = const Value.absent(),
    Value<String?> prayerAnchor = const Value.absent(),
    int? snoozeMinutes,
    DateTime? updatedAt,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => ReminderEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    originalTranscript:
        originalTranscript.present
            ? originalTranscript.value
            : this.originalTranscript,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    createdAt: createdAt ?? this.createdAt,
    typeIndex: typeIndex ?? this.typeIndex,
    statusIndex: statusIndex ?? this.statusIndex,
    recurrenceJson:
        recurrenceJson.present ? recurrenceJson.value : this.recurrenceJson,
    prayerAnchor: prayerAnchor.present ? prayerAnchor.value : this.prayerAnchor,
    snoozeMinutes: snoozeMinutes ?? this.snoozeMinutes,
    updatedAt: updatedAt ?? this.updatedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  ReminderEntity copyWithCompanion(ReminderEntitiesCompanion data) {
    return ReminderEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      originalTranscript:
          data.originalTranscript.present
              ? data.originalTranscript.value
              : this.originalTranscript,
      scheduledAt:
          data.scheduledAt.present ? data.scheduledAt.value : this.scheduledAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      statusIndex:
          data.statusIndex.present ? data.statusIndex.value : this.statusIndex,
      recurrenceJson:
          data.recurrenceJson.present
              ? data.recurrenceJson.value
              : this.recurrenceJson,
      prayerAnchor:
          data.prayerAnchor.present
              ? data.prayerAnchor.value
              : this.prayerAnchor,
      snoozeMinutes:
          data.snoozeMinutes.present
              ? data.snoozeMinutes.value
              : this.snoozeMinutes,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('originalTranscript: $originalTranscript, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('statusIndex: $statusIndex, ')
          ..write('recurrenceJson: $recurrenceJson, ')
          ..write('prayerAnchor: $prayerAnchor, ')
          ..write('snoozeMinutes: $snoozeMinutes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    originalTranscript,
    scheduledAt,
    createdAt,
    typeIndex,
    statusIndex,
    recurrenceJson,
    prayerAnchor,
    snoozeMinutes,
    updatedAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.originalTranscript == this.originalTranscript &&
          other.scheduledAt == this.scheduledAt &&
          other.createdAt == this.createdAt &&
          other.typeIndex == this.typeIndex &&
          other.statusIndex == this.statusIndex &&
          other.recurrenceJson == this.recurrenceJson &&
          other.prayerAnchor == this.prayerAnchor &&
          other.snoozeMinutes == this.snoozeMinutes &&
          other.updatedAt == this.updatedAt &&
          other.completedAt == this.completedAt);
}

class ReminderEntitiesCompanion extends UpdateCompanion<ReminderEntity> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> originalTranscript;
  final Value<DateTime> scheduledAt;
  final Value<DateTime> createdAt;
  final Value<int> typeIndex;
  final Value<int> statusIndex;
  final Value<String?> recurrenceJson;
  final Value<String?> prayerAnchor;
  final Value<int> snoozeMinutes;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const ReminderEntitiesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.originalTranscript = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.statusIndex = const Value.absent(),
    this.recurrenceJson = const Value.absent(),
    this.prayerAnchor = const Value.absent(),
    this.snoozeMinutes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReminderEntitiesCompanion.insert({
    required String id,
    required String title,
    this.originalTranscript = const Value.absent(),
    required DateTime scheduledAt,
    required DateTime createdAt,
    required int typeIndex,
    required int statusIndex,
    this.recurrenceJson = const Value.absent(),
    this.prayerAnchor = const Value.absent(),
    this.snoozeMinutes = const Value.absent(),
    required DateTime updatedAt,
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       scheduledAt = Value(scheduledAt),
       createdAt = Value(createdAt),
       typeIndex = Value(typeIndex),
       statusIndex = Value(statusIndex),
       updatedAt = Value(updatedAt);
  static Insertable<ReminderEntity> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? originalTranscript,
    Expression<DateTime>? scheduledAt,
    Expression<DateTime>? createdAt,
    Expression<int>? typeIndex,
    Expression<int>? statusIndex,
    Expression<String>? recurrenceJson,
    Expression<String>? prayerAnchor,
    Expression<int>? snoozeMinutes,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (originalTranscript != null) 'original_transcript': originalTranscript,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (createdAt != null) 'created_at': createdAt,
      if (typeIndex != null) 'type_index': typeIndex,
      if (statusIndex != null) 'status_index': statusIndex,
      if (recurrenceJson != null) 'recurrence_json': recurrenceJson,
      if (prayerAnchor != null) 'prayer_anchor': prayerAnchor,
      if (snoozeMinutes != null) 'snooze_minutes': snoozeMinutes,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReminderEntitiesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? originalTranscript,
    Value<DateTime>? scheduledAt,
    Value<DateTime>? createdAt,
    Value<int>? typeIndex,
    Value<int>? statusIndex,
    Value<String?>? recurrenceJson,
    Value<String?>? prayerAnchor,
    Value<int>? snoozeMinutes,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return ReminderEntitiesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      originalTranscript: originalTranscript ?? this.originalTranscript,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      createdAt: createdAt ?? this.createdAt,
      typeIndex: typeIndex ?? this.typeIndex,
      statusIndex: statusIndex ?? this.statusIndex,
      recurrenceJson: recurrenceJson ?? this.recurrenceJson,
      prayerAnchor: prayerAnchor ?? this.prayerAnchor,
      snoozeMinutes: snoozeMinutes ?? this.snoozeMinutes,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (originalTranscript.present) {
      map['original_transcript'] = Variable<String>(originalTranscript.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (statusIndex.present) {
      map['status_index'] = Variable<int>(statusIndex.value);
    }
    if (recurrenceJson.present) {
      map['recurrence_json'] = Variable<String>(recurrenceJson.value);
    }
    if (prayerAnchor.present) {
      map['prayer_anchor'] = Variable<String>(prayerAnchor.value);
    }
    if (snoozeMinutes.present) {
      map['snooze_minutes'] = Variable<int>(snoozeMinutes.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('originalTranscript: $originalTranscript, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('statusIndex: $statusIndex, ')
          ..write('recurrenceJson: $recurrenceJson, ')
          ..write('prayerAnchor: $prayerAnchor, ')
          ..write('snoozeMinutes: $snoozeMinutes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReminderEventsTable extends ReminderEvents
    with TableInfo<$ReminderEventsTable, ReminderEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reminderIdMeta = const VerificationMeta(
    'reminderId',
  );
  @override
  late final GeneratedColumn<String> reminderId = GeneratedColumn<String>(
    'reminder_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reminder_entities (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reminderId,
    type,
    occurredAt,
    payloadJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('reminder_id')) {
      context.handle(
        _reminderIdMeta,
        reminderId.isAcceptableOrUnknown(data['reminder_id']!, _reminderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reminderIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderEvent(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      reminderId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}reminder_id'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      occurredAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}occurred_at'],
          )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      ),
    );
  }

  @override
  $ReminderEventsTable createAlias(String alias) {
    return $ReminderEventsTable(attachedDatabase, alias);
  }
}

class ReminderEvent extends DataClass implements Insertable<ReminderEvent> {
  final String id;
  final String reminderId;
  final String type;
  final DateTime occurredAt;
  final String? payloadJson;
  const ReminderEvent({
    required this.id,
    required this.reminderId,
    required this.type,
    required this.occurredAt,
    this.payloadJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['reminder_id'] = Variable<String>(reminderId);
    map['type'] = Variable<String>(type);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || payloadJson != null) {
      map['payload_json'] = Variable<String>(payloadJson);
    }
    return map;
  }

  ReminderEventsCompanion toCompanion(bool nullToAbsent) {
    return ReminderEventsCompanion(
      id: Value(id),
      reminderId: Value(reminderId),
      type: Value(type),
      occurredAt: Value(occurredAt),
      payloadJson:
          payloadJson == null && nullToAbsent
              ? const Value.absent()
              : Value(payloadJson),
    );
  }

  factory ReminderEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderEvent(
      id: serializer.fromJson<String>(json['id']),
      reminderId: serializer.fromJson<String>(json['reminderId']),
      type: serializer.fromJson<String>(json['type']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      payloadJson: serializer.fromJson<String?>(json['payloadJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'reminderId': serializer.toJson<String>(reminderId),
      'type': serializer.toJson<String>(type),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'payloadJson': serializer.toJson<String?>(payloadJson),
    };
  }

  ReminderEvent copyWith({
    String? id,
    String? reminderId,
    String? type,
    DateTime? occurredAt,
    Value<String?> payloadJson = const Value.absent(),
  }) => ReminderEvent(
    id: id ?? this.id,
    reminderId: reminderId ?? this.reminderId,
    type: type ?? this.type,
    occurredAt: occurredAt ?? this.occurredAt,
    payloadJson: payloadJson.present ? payloadJson.value : this.payloadJson,
  );
  ReminderEvent copyWithCompanion(ReminderEventsCompanion data) {
    return ReminderEvent(
      id: data.id.present ? data.id.value : this.id,
      reminderId:
          data.reminderId.present ? data.reminderId.value : this.reminderId,
      type: data.type.present ? data.type.value : this.type,
      occurredAt:
          data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
      payloadJson:
          data.payloadJson.present ? data.payloadJson.value : this.payloadJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderEvent(')
          ..write('id: $id, ')
          ..write('reminderId: $reminderId, ')
          ..write('type: $type, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('payloadJson: $payloadJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, reminderId, type, occurredAt, payloadJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderEvent &&
          other.id == this.id &&
          other.reminderId == this.reminderId &&
          other.type == this.type &&
          other.occurredAt == this.occurredAt &&
          other.payloadJson == this.payloadJson);
}

class ReminderEventsCompanion extends UpdateCompanion<ReminderEvent> {
  final Value<String> id;
  final Value<String> reminderId;
  final Value<String> type;
  final Value<DateTime> occurredAt;
  final Value<String?> payloadJson;
  final Value<int> rowid;
  const ReminderEventsCompanion({
    this.id = const Value.absent(),
    this.reminderId = const Value.absent(),
    this.type = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReminderEventsCompanion.insert({
    required String id,
    required String reminderId,
    required String type,
    required DateTime occurredAt,
    this.payloadJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       reminderId = Value(reminderId),
       type = Value(type),
       occurredAt = Value(occurredAt);
  static Insertable<ReminderEvent> custom({
    Expression<String>? id,
    Expression<String>? reminderId,
    Expression<String>? type,
    Expression<DateTime>? occurredAt,
    Expression<String>? payloadJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reminderId != null) 'reminder_id': reminderId,
      if (type != null) 'type': type,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReminderEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? reminderId,
    Value<String>? type,
    Value<DateTime>? occurredAt,
    Value<String?>? payloadJson,
    Value<int>? rowid,
  }) {
    return ReminderEventsCompanion(
      id: id ?? this.id,
      reminderId: reminderId ?? this.reminderId,
      type: type ?? this.type,
      occurredAt: occurredAt ?? this.occurredAt,
      payloadJson: payloadJson ?? this.payloadJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (reminderId.present) {
      map['reminder_id'] = Variable<String>(reminderId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderEventsCompanion(')
          ..write('id: $id, ')
          ..write('reminderId: $reminderId, ')
          ..write('type: $type, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}key'],
          )!,
      value:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}value'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$FakkerniDatabase extends GeneratedDatabase {
  _$FakkerniDatabase(QueryExecutor e) : super(e);
  $FakkerniDatabaseManager get managers => $FakkerniDatabaseManager(this);
  late final $ReminderEntitiesTable reminderEntities = $ReminderEntitiesTable(
    this,
  );
  late final $ReminderEventsTable reminderEvents = $ReminderEventsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    reminderEntities,
    reminderEvents,
    appSettings,
  ];
}

typedef $$ReminderEntitiesTableCreateCompanionBuilder =
    ReminderEntitiesCompanion Function({
      required String id,
      required String title,
      Value<String?> originalTranscript,
      required DateTime scheduledAt,
      required DateTime createdAt,
      required int typeIndex,
      required int statusIndex,
      Value<String?> recurrenceJson,
      Value<String?> prayerAnchor,
      Value<int> snoozeMinutes,
      required DateTime updatedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$ReminderEntitiesTableUpdateCompanionBuilder =
    ReminderEntitiesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> originalTranscript,
      Value<DateTime> scheduledAt,
      Value<DateTime> createdAt,
      Value<int> typeIndex,
      Value<int> statusIndex,
      Value<String?> recurrenceJson,
      Value<String?> prayerAnchor,
      Value<int> snoozeMinutes,
      Value<DateTime> updatedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

final class $$ReminderEntitiesTableReferences
    extends
        BaseReferences<
          _$FakkerniDatabase,
          $ReminderEntitiesTable,
          ReminderEntity
        > {
  $$ReminderEntitiesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ReminderEventsTable, List<ReminderEvent>>
  _reminderEventsRefsTable(_$FakkerniDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reminderEvents,
        aliasName: $_aliasNameGenerator(
          db.reminderEntities.id,
          db.reminderEvents.reminderId,
        ),
      );

  $$ReminderEventsTableProcessedTableManager get reminderEventsRefs {
    final manager = $$ReminderEventsTableTableManager(
      $_db,
      $_db.reminderEvents,
    ).filter((f) => f.reminderId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_reminderEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReminderEntitiesTableFilterComposer
    extends Composer<_$FakkerniDatabase, $ReminderEntitiesTable> {
  $$ReminderEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalTranscript => $composableBuilder(
    column: $table.originalTranscript,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get typeIndex => $composableBuilder(
    column: $table.typeIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statusIndex => $composableBuilder(
    column: $table.statusIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrenceJson => $composableBuilder(
    column: $table.recurrenceJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prayerAnchor => $composableBuilder(
    column: $table.prayerAnchor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get snoozeMinutes => $composableBuilder(
    column: $table.snoozeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reminderEventsRefs(
    Expression<bool> Function($$ReminderEventsTableFilterComposer f) f,
  ) {
    final $$ReminderEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminderEvents,
      getReferencedColumn: (t) => t.reminderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderEventsTableFilterComposer(
            $db: $db,
            $table: $db.reminderEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReminderEntitiesTableOrderingComposer
    extends Composer<_$FakkerniDatabase, $ReminderEntitiesTable> {
  $$ReminderEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalTranscript => $composableBuilder(
    column: $table.originalTranscript,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get typeIndex => $composableBuilder(
    column: $table.typeIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statusIndex => $composableBuilder(
    column: $table.statusIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrenceJson => $composableBuilder(
    column: $table.recurrenceJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prayerAnchor => $composableBuilder(
    column: $table.prayerAnchor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get snoozeMinutes => $composableBuilder(
    column: $table.snoozeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReminderEntitiesTableAnnotationComposer
    extends Composer<_$FakkerniDatabase, $ReminderEntitiesTable> {
  $$ReminderEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get originalTranscript => $composableBuilder(
    column: $table.originalTranscript,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get typeIndex =>
      $composableBuilder(column: $table.typeIndex, builder: (column) => column);

  GeneratedColumn<int> get statusIndex => $composableBuilder(
    column: $table.statusIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recurrenceJson => $composableBuilder(
    column: $table.recurrenceJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prayerAnchor => $composableBuilder(
    column: $table.prayerAnchor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get snoozeMinutes => $composableBuilder(
    column: $table.snoozeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  Expression<T> reminderEventsRefs<T extends Object>(
    Expression<T> Function($$ReminderEventsTableAnnotationComposer a) f,
  ) {
    final $$ReminderEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminderEvents,
      getReferencedColumn: (t) => t.reminderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.reminderEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReminderEntitiesTableTableManager
    extends
        RootTableManager<
          _$FakkerniDatabase,
          $ReminderEntitiesTable,
          ReminderEntity,
          $$ReminderEntitiesTableFilterComposer,
          $$ReminderEntitiesTableOrderingComposer,
          $$ReminderEntitiesTableAnnotationComposer,
          $$ReminderEntitiesTableCreateCompanionBuilder,
          $$ReminderEntitiesTableUpdateCompanionBuilder,
          (ReminderEntity, $$ReminderEntitiesTableReferences),
          ReminderEntity,
          PrefetchHooks Function({bool reminderEventsRefs})
        > {
  $$ReminderEntitiesTableTableManager(
    _$FakkerniDatabase db,
    $ReminderEntitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$ReminderEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ReminderEntitiesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ReminderEntitiesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> originalTranscript = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> typeIndex = const Value.absent(),
                Value<int> statusIndex = const Value.absent(),
                Value<String?> recurrenceJson = const Value.absent(),
                Value<String?> prayerAnchor = const Value.absent(),
                Value<int> snoozeMinutes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReminderEntitiesCompanion(
                id: id,
                title: title,
                originalTranscript: originalTranscript,
                scheduledAt: scheduledAt,
                createdAt: createdAt,
                typeIndex: typeIndex,
                statusIndex: statusIndex,
                recurrenceJson: recurrenceJson,
                prayerAnchor: prayerAnchor,
                snoozeMinutes: snoozeMinutes,
                updatedAt: updatedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> originalTranscript = const Value.absent(),
                required DateTime scheduledAt,
                required DateTime createdAt,
                required int typeIndex,
                required int statusIndex,
                Value<String?> recurrenceJson = const Value.absent(),
                Value<String?> prayerAnchor = const Value.absent(),
                Value<int> snoozeMinutes = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReminderEntitiesCompanion.insert(
                id: id,
                title: title,
                originalTranscript: originalTranscript,
                scheduledAt: scheduledAt,
                createdAt: createdAt,
                typeIndex: typeIndex,
                statusIndex: statusIndex,
                recurrenceJson: recurrenceJson,
                prayerAnchor: prayerAnchor,
                snoozeMinutes: snoozeMinutes,
                updatedAt: updatedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ReminderEntitiesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({reminderEventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (reminderEventsRefs) db.reminderEvents,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reminderEventsRefs)
                    await $_getPrefetchedData<
                      ReminderEntity,
                      $ReminderEntitiesTable,
                      ReminderEvent
                    >(
                      currentTable: table,
                      referencedTable: $$ReminderEntitiesTableReferences
                          ._reminderEventsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ReminderEntitiesTableReferences(
                                db,
                                table,
                                p0,
                              ).reminderEventsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.reminderId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ReminderEntitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$FakkerniDatabase,
      $ReminderEntitiesTable,
      ReminderEntity,
      $$ReminderEntitiesTableFilterComposer,
      $$ReminderEntitiesTableOrderingComposer,
      $$ReminderEntitiesTableAnnotationComposer,
      $$ReminderEntitiesTableCreateCompanionBuilder,
      $$ReminderEntitiesTableUpdateCompanionBuilder,
      (ReminderEntity, $$ReminderEntitiesTableReferences),
      ReminderEntity,
      PrefetchHooks Function({bool reminderEventsRefs})
    >;
typedef $$ReminderEventsTableCreateCompanionBuilder =
    ReminderEventsCompanion Function({
      required String id,
      required String reminderId,
      required String type,
      required DateTime occurredAt,
      Value<String?> payloadJson,
      Value<int> rowid,
    });
typedef $$ReminderEventsTableUpdateCompanionBuilder =
    ReminderEventsCompanion Function({
      Value<String> id,
      Value<String> reminderId,
      Value<String> type,
      Value<DateTime> occurredAt,
      Value<String?> payloadJson,
      Value<int> rowid,
    });

final class $$ReminderEventsTableReferences
    extends
        BaseReferences<
          _$FakkerniDatabase,
          $ReminderEventsTable,
          ReminderEvent
        > {
  $$ReminderEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ReminderEntitiesTable _reminderIdTable(_$FakkerniDatabase db) =>
      db.reminderEntities.createAlias(
        $_aliasNameGenerator(
          db.reminderEvents.reminderId,
          db.reminderEntities.id,
        ),
      );

  $$ReminderEntitiesTableProcessedTableManager get reminderId {
    final $_column = $_itemColumn<String>('reminder_id')!;

    final manager = $$ReminderEntitiesTableTableManager(
      $_db,
      $_db.reminderEntities,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reminderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReminderEventsTableFilterComposer
    extends Composer<_$FakkerniDatabase, $ReminderEventsTable> {
  $$ReminderEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  $$ReminderEntitiesTableFilterComposer get reminderId {
    final $$ReminderEntitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reminderId,
      referencedTable: $db.reminderEntities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderEntitiesTableFilterComposer(
            $db: $db,
            $table: $db.reminderEntities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderEventsTableOrderingComposer
    extends Composer<_$FakkerniDatabase, $ReminderEventsTable> {
  $$ReminderEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReminderEntitiesTableOrderingComposer get reminderId {
    final $$ReminderEntitiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reminderId,
      referencedTable: $db.reminderEntities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderEntitiesTableOrderingComposer(
            $db: $db,
            $table: $db.reminderEntities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderEventsTableAnnotationComposer
    extends Composer<_$FakkerniDatabase, $ReminderEventsTable> {
  $$ReminderEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  $$ReminderEntitiesTableAnnotationComposer get reminderId {
    final $$ReminderEntitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reminderId,
      referencedTable: $db.reminderEntities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderEntitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.reminderEntities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderEventsTableTableManager
    extends
        RootTableManager<
          _$FakkerniDatabase,
          $ReminderEventsTable,
          ReminderEvent,
          $$ReminderEventsTableFilterComposer,
          $$ReminderEventsTableOrderingComposer,
          $$ReminderEventsTableAnnotationComposer,
          $$ReminderEventsTableCreateCompanionBuilder,
          $$ReminderEventsTableUpdateCompanionBuilder,
          (ReminderEvent, $$ReminderEventsTableReferences),
          ReminderEvent,
          PrefetchHooks Function({bool reminderId})
        > {
  $$ReminderEventsTableTableManager(
    _$FakkerniDatabase db,
    $ReminderEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ReminderEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ReminderEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ReminderEventsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> reminderId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<String?> payloadJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReminderEventsCompanion(
                id: id,
                reminderId: reminderId,
                type: type,
                occurredAt: occurredAt,
                payloadJson: payloadJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String reminderId,
                required String type,
                required DateTime occurredAt,
                Value<String?> payloadJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReminderEventsCompanion.insert(
                id: id,
                reminderId: reminderId,
                type: type,
                occurredAt: occurredAt,
                payloadJson: payloadJson,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ReminderEventsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({reminderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (reminderId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.reminderId,
                            referencedTable: $$ReminderEventsTableReferences
                                ._reminderIdTable(db),
                            referencedColumn:
                                $$ReminderEventsTableReferences
                                    ._reminderIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReminderEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$FakkerniDatabase,
      $ReminderEventsTable,
      ReminderEvent,
      $$ReminderEventsTableFilterComposer,
      $$ReminderEventsTableOrderingComposer,
      $$ReminderEventsTableAnnotationComposer,
      $$ReminderEventsTableCreateCompanionBuilder,
      $$ReminderEventsTableUpdateCompanionBuilder,
      (ReminderEvent, $$ReminderEventsTableReferences),
      ReminderEvent,
      PrefetchHooks Function({bool reminderId})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$FakkerniDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$FakkerniDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$FakkerniDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$FakkerniDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$FakkerniDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$FakkerniDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$FakkerniDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$FakkerniDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $FakkerniDatabaseManager {
  final _$FakkerniDatabase _db;
  $FakkerniDatabaseManager(this._db);
  $$ReminderEntitiesTableTableManager get reminderEntities =>
      $$ReminderEntitiesTableTableManager(_db, _db.reminderEntities);
  $$ReminderEventsTableTableManager get reminderEvents =>
      $$ReminderEventsTableTableManager(_db, _db.reminderEvents);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
