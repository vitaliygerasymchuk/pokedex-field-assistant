// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PokemonIndexEntityTable extends PokemonIndexEntity
    with TableInfo<$PokemonIndexEntityTable, PokemonIndexEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonIndexEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_index_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<PokemonIndexEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonIndexEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonIndexEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $PokemonIndexEntityTable createAlias(String alias) {
    return $PokemonIndexEntityTable(attachedDatabase, alias);
  }
}

class PokemonIndexEntityData extends DataClass
    implements Insertable<PokemonIndexEntityData> {
  final int id;
  final String name;
  const PokemonIndexEntityData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  PokemonIndexEntityCompanion toCompanion(bool nullToAbsent) {
    return PokemonIndexEntityCompanion(id: Value(id), name: Value(name));
  }

  factory PokemonIndexEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonIndexEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  PokemonIndexEntityData copyWith({int? id, String? name}) =>
      PokemonIndexEntityData(id: id ?? this.id, name: name ?? this.name);
  PokemonIndexEntityData copyWithCompanion(PokemonIndexEntityCompanion data) {
    return PokemonIndexEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonIndexEntityData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonIndexEntityData &&
          other.id == this.id &&
          other.name == this.name);
}

class PokemonIndexEntityCompanion
    extends UpdateCompanion<PokemonIndexEntityData> {
  final Value<int> id;
  final Value<String> name;
  const PokemonIndexEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PokemonIndexEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<PokemonIndexEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PokemonIndexEntityCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return PokemonIndexEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonIndexEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CacheMetadataEntityTable extends CacheMetadataEntity
    with TableInfo<$CacheMetadataEntityTable, CacheMetadataEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheMetadataEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
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
  List<GeneratedColumn> get $columns => [cacheKey, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache_metadata_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<CacheMetadataEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
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
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  CacheMetadataEntityData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CacheMetadataEntityData(
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CacheMetadataEntityTable createAlias(String alias) {
    return $CacheMetadataEntityTable(attachedDatabase, alias);
  }
}

class CacheMetadataEntityData extends DataClass
    implements Insertable<CacheMetadataEntityData> {
  final String cacheKey;
  final DateTime updatedAt;
  const CacheMetadataEntityData({
    required this.cacheKey,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cache_key'] = Variable<String>(cacheKey);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CacheMetadataEntityCompanion toCompanion(bool nullToAbsent) {
    return CacheMetadataEntityCompanion(
      cacheKey: Value(cacheKey),
      updatedAt: Value(updatedAt),
    );
  }

  factory CacheMetadataEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CacheMetadataEntityData(
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cacheKey': serializer.toJson<String>(cacheKey),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CacheMetadataEntityData copyWith({String? cacheKey, DateTime? updatedAt}) =>
      CacheMetadataEntityData(
        cacheKey: cacheKey ?? this.cacheKey,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CacheMetadataEntityData copyWithCompanion(CacheMetadataEntityCompanion data) {
    return CacheMetadataEntityData(
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CacheMetadataEntityData(')
          ..write('cacheKey: $cacheKey, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cacheKey, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CacheMetadataEntityData &&
          other.cacheKey == this.cacheKey &&
          other.updatedAt == this.updatedAt);
}

class CacheMetadataEntityCompanion
    extends UpdateCompanion<CacheMetadataEntityData> {
  final Value<String> cacheKey;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CacheMetadataEntityCompanion({
    this.cacheKey = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CacheMetadataEntityCompanion.insert({
    required String cacheKey,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       updatedAt = Value(updatedAt);
  static Insertable<CacheMetadataEntityData> custom({
    Expression<String>? cacheKey,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cacheKey != null) 'cache_key': cacheKey,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CacheMetadataEntityCompanion copyWith({
    Value<String>? cacheKey,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CacheMetadataEntityCompanion(
      cacheKey: cacheKey ?? this.cacheKey,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
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
    return (StringBuffer('CacheMetadataEntityCompanion(')
          ..write('cacheKey: $cacheKey, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PokemonIndexEntityTable pokemonIndexEntity =
      $PokemonIndexEntityTable(this);
  late final $CacheMetadataEntityTable cacheMetadataEntity =
      $CacheMetadataEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pokemonIndexEntity,
    cacheMetadataEntity,
  ];
}

typedef $$PokemonIndexEntityTableCreateCompanionBuilder =
    PokemonIndexEntityCompanion Function({Value<int> id, required String name});
typedef $$PokemonIndexEntityTableUpdateCompanionBuilder =
    PokemonIndexEntityCompanion Function({Value<int> id, Value<String> name});

class $$PokemonIndexEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonIndexEntityTable> {
  $$PokemonIndexEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PokemonIndexEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonIndexEntityTable> {
  $$PokemonIndexEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PokemonIndexEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonIndexEntityTable> {
  $$PokemonIndexEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$PokemonIndexEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PokemonIndexEntityTable,
          PokemonIndexEntityData,
          $$PokemonIndexEntityTableFilterComposer,
          $$PokemonIndexEntityTableOrderingComposer,
          $$PokemonIndexEntityTableAnnotationComposer,
          $$PokemonIndexEntityTableCreateCompanionBuilder,
          $$PokemonIndexEntityTableUpdateCompanionBuilder,
          (
            PokemonIndexEntityData,
            BaseReferences<
              _$AppDatabase,
              $PokemonIndexEntityTable,
              PokemonIndexEntityData
            >,
          ),
          PokemonIndexEntityData,
          PrefetchHooks Function()
        > {
  $$PokemonIndexEntityTableTableManager(
    _$AppDatabase db,
    $PokemonIndexEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonIndexEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonIndexEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonIndexEntityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => PokemonIndexEntityCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  PokemonIndexEntityCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PokemonIndexEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PokemonIndexEntityTable,
      PokemonIndexEntityData,
      $$PokemonIndexEntityTableFilterComposer,
      $$PokemonIndexEntityTableOrderingComposer,
      $$PokemonIndexEntityTableAnnotationComposer,
      $$PokemonIndexEntityTableCreateCompanionBuilder,
      $$PokemonIndexEntityTableUpdateCompanionBuilder,
      (
        PokemonIndexEntityData,
        BaseReferences<
          _$AppDatabase,
          $PokemonIndexEntityTable,
          PokemonIndexEntityData
        >,
      ),
      PokemonIndexEntityData,
      PrefetchHooks Function()
    >;
typedef $$CacheMetadataEntityTableCreateCompanionBuilder =
    CacheMetadataEntityCompanion Function({
      required String cacheKey,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CacheMetadataEntityTableUpdateCompanionBuilder =
    CacheMetadataEntityCompanion Function({
      Value<String> cacheKey,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CacheMetadataEntityTableFilterComposer
    extends Composer<_$AppDatabase, $CacheMetadataEntityTable> {
  $$CacheMetadataEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CacheMetadataEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $CacheMetadataEntityTable> {
  $$CacheMetadataEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CacheMetadataEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $CacheMetadataEntityTable> {
  $$CacheMetadataEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CacheMetadataEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CacheMetadataEntityTable,
          CacheMetadataEntityData,
          $$CacheMetadataEntityTableFilterComposer,
          $$CacheMetadataEntityTableOrderingComposer,
          $$CacheMetadataEntityTableAnnotationComposer,
          $$CacheMetadataEntityTableCreateCompanionBuilder,
          $$CacheMetadataEntityTableUpdateCompanionBuilder,
          (
            CacheMetadataEntityData,
            BaseReferences<
              _$AppDatabase,
              $CacheMetadataEntityTable,
              CacheMetadataEntityData
            >,
          ),
          CacheMetadataEntityData,
          PrefetchHooks Function()
        > {
  $$CacheMetadataEntityTableTableManager(
    _$AppDatabase db,
    $CacheMetadataEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CacheMetadataEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CacheMetadataEntityTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CacheMetadataEntityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> cacheKey = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CacheMetadataEntityCompanion(
                cacheKey: cacheKey,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cacheKey,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CacheMetadataEntityCompanion.insert(
                cacheKey: cacheKey,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CacheMetadataEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CacheMetadataEntityTable,
      CacheMetadataEntityData,
      $$CacheMetadataEntityTableFilterComposer,
      $$CacheMetadataEntityTableOrderingComposer,
      $$CacheMetadataEntityTableAnnotationComposer,
      $$CacheMetadataEntityTableCreateCompanionBuilder,
      $$CacheMetadataEntityTableUpdateCompanionBuilder,
      (
        CacheMetadataEntityData,
        BaseReferences<
          _$AppDatabase,
          $CacheMetadataEntityTable,
          CacheMetadataEntityData
        >,
      ),
      CacheMetadataEntityData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PokemonIndexEntityTableTableManager get pokemonIndexEntity =>
      $$PokemonIndexEntityTableTableManager(_db, _db.pokemonIndexEntity);
  $$CacheMetadataEntityTableTableManager get cacheMetadataEntity =>
      $$CacheMetadataEntityTableTableManager(_db, _db.cacheMetadataEntity);
}
