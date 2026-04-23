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

class $BookmarkEntityTable extends BookmarkEntity
    with TableInfo<$BookmarkEntityTable, BookmarkEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bookmarkedAtMeta = const VerificationMeta(
    'bookmarkedAt',
  );
  @override
  late final GeneratedColumn<DateTime> bookmarkedAt = GeneratedColumn<DateTime>(
    'bookmarked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, bookmarkedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookmarkEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bookmarked_at')) {
      context.handle(
        _bookmarkedAtMeta,
        bookmarkedAt.isAcceptableOrUnknown(
          data['bookmarked_at']!,
          _bookmarkedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bookmarkedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      bookmarkedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}bookmarked_at'],
      )!,
    );
  }

  @override
  $BookmarkEntityTable createAlias(String alias) {
    return $BookmarkEntityTable(attachedDatabase, alias);
  }
}

class BookmarkEntityData extends DataClass
    implements Insertable<BookmarkEntityData> {
  final int id;
  final DateTime bookmarkedAt;
  const BookmarkEntityData({required this.id, required this.bookmarkedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bookmarked_at'] = Variable<DateTime>(bookmarkedAt);
    return map;
  }

  BookmarkEntityCompanion toCompanion(bool nullToAbsent) {
    return BookmarkEntityCompanion(
      id: Value(id),
      bookmarkedAt: Value(bookmarkedAt),
    );
  }

  factory BookmarkEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkEntityData(
      id: serializer.fromJson<int>(json['id']),
      bookmarkedAt: serializer.fromJson<DateTime>(json['bookmarkedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookmarkedAt': serializer.toJson<DateTime>(bookmarkedAt),
    };
  }

  BookmarkEntityData copyWith({int? id, DateTime? bookmarkedAt}) =>
      BookmarkEntityData(
        id: id ?? this.id,
        bookmarkedAt: bookmarkedAt ?? this.bookmarkedAt,
      );
  BookmarkEntityData copyWithCompanion(BookmarkEntityCompanion data) {
    return BookmarkEntityData(
      id: data.id.present ? data.id.value : this.id,
      bookmarkedAt: data.bookmarkedAt.present
          ? data.bookmarkedAt.value
          : this.bookmarkedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkEntityData(')
          ..write('id: $id, ')
          ..write('bookmarkedAt: $bookmarkedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bookmarkedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkEntityData &&
          other.id == this.id &&
          other.bookmarkedAt == this.bookmarkedAt);
}

class BookmarkEntityCompanion extends UpdateCompanion<BookmarkEntityData> {
  final Value<int> id;
  final Value<DateTime> bookmarkedAt;
  const BookmarkEntityCompanion({
    this.id = const Value.absent(),
    this.bookmarkedAt = const Value.absent(),
  });
  BookmarkEntityCompanion.insert({
    this.id = const Value.absent(),
    required DateTime bookmarkedAt,
  }) : bookmarkedAt = Value(bookmarkedAt);
  static Insertable<BookmarkEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? bookmarkedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookmarkedAt != null) 'bookmarked_at': bookmarkedAt,
    });
  }

  BookmarkEntityCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? bookmarkedAt,
  }) {
    return BookmarkEntityCompanion(
      id: id ?? this.id,
      bookmarkedAt: bookmarkedAt ?? this.bookmarkedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookmarkedAt.present) {
      map['bookmarked_at'] = Variable<DateTime>(bookmarkedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkEntityCompanion(')
          ..write('id: $id, ')
          ..write('bookmarkedAt: $bookmarkedAt')
          ..write(')'))
        .toString();
  }
}

class $PokemonDetailsEntityTable extends PokemonDetailsEntity
    with TableInfo<$PokemonDetailsEntityTable, PokemonDetailsEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonDetailsEntityTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _spriteUrlMeta = const VerificationMeta(
    'spriteUrl',
  );
  @override
  late final GeneratedColumn<String> spriteUrl = GeneratedColumn<String>(
    'sprite_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightDmMeta = const VerificationMeta(
    'heightDm',
  );
  @override
  late final GeneratedColumn<int> heightDm = GeneratedColumn<int>(
    'height_dm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightHgMeta = const VerificationMeta(
    'weightHg',
  );
  @override
  late final GeneratedColumn<int> weightHg = GeneratedColumn<int>(
    'weight_hg',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typesJsonMeta = const VerificationMeta(
    'typesJson',
  );
  @override
  late final GeneratedColumn<String> typesJson = GeneratedColumn<String>(
    'types_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _abilitiesJsonMeta = const VerificationMeta(
    'abilitiesJson',
  );
  @override
  late final GeneratedColumn<String> abilitiesJson = GeneratedColumn<String>(
    'abilities_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statsJsonMeta = const VerificationMeta(
    'statsJson',
  );
  @override
  late final GeneratedColumn<String> statsJson = GeneratedColumn<String>(
    'stats_json',
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
  List<GeneratedColumn> get $columns => [
    id,
    name,
    spriteUrl,
    heightDm,
    weightHg,
    typesJson,
    abilitiesJson,
    statsJson,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_details_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<PokemonDetailsEntityData> instance, {
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
    if (data.containsKey('sprite_url')) {
      context.handle(
        _spriteUrlMeta,
        spriteUrl.isAcceptableOrUnknown(data['sprite_url']!, _spriteUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_spriteUrlMeta);
    }
    if (data.containsKey('height_dm')) {
      context.handle(
        _heightDmMeta,
        heightDm.isAcceptableOrUnknown(data['height_dm']!, _heightDmMeta),
      );
    } else if (isInserting) {
      context.missing(_heightDmMeta);
    }
    if (data.containsKey('weight_hg')) {
      context.handle(
        _weightHgMeta,
        weightHg.isAcceptableOrUnknown(data['weight_hg']!, _weightHgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightHgMeta);
    }
    if (data.containsKey('types_json')) {
      context.handle(
        _typesJsonMeta,
        typesJson.isAcceptableOrUnknown(data['types_json']!, _typesJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_typesJsonMeta);
    }
    if (data.containsKey('abilities_json')) {
      context.handle(
        _abilitiesJsonMeta,
        abilitiesJson.isAcceptableOrUnknown(
          data['abilities_json']!,
          _abilitiesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_abilitiesJsonMeta);
    }
    if (data.containsKey('stats_json')) {
      context.handle(
        _statsJsonMeta,
        statsJson.isAcceptableOrUnknown(data['stats_json']!, _statsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_statsJsonMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonDetailsEntityData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonDetailsEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      spriteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sprite_url'],
      )!,
      heightDm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height_dm'],
      )!,
      weightHg: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weight_hg'],
      )!,
      typesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}types_json'],
      )!,
      abilitiesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}abilities_json'],
      )!,
      statsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stats_json'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PokemonDetailsEntityTable createAlias(String alias) {
    return $PokemonDetailsEntityTable(attachedDatabase, alias);
  }
}

class PokemonDetailsEntityData extends DataClass
    implements Insertable<PokemonDetailsEntityData> {
  final int id;
  final String name;
  final String spriteUrl;
  final int heightDm;
  final int weightHg;
  final String typesJson;
  final String abilitiesJson;
  final String statsJson;
  final DateTime updatedAt;
  const PokemonDetailsEntityData({
    required this.id,
    required this.name,
    required this.spriteUrl,
    required this.heightDm,
    required this.weightHg,
    required this.typesJson,
    required this.abilitiesJson,
    required this.statsJson,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sprite_url'] = Variable<String>(spriteUrl);
    map['height_dm'] = Variable<int>(heightDm);
    map['weight_hg'] = Variable<int>(weightHg);
    map['types_json'] = Variable<String>(typesJson);
    map['abilities_json'] = Variable<String>(abilitiesJson);
    map['stats_json'] = Variable<String>(statsJson);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PokemonDetailsEntityCompanion toCompanion(bool nullToAbsent) {
    return PokemonDetailsEntityCompanion(
      id: Value(id),
      name: Value(name),
      spriteUrl: Value(spriteUrl),
      heightDm: Value(heightDm),
      weightHg: Value(weightHg),
      typesJson: Value(typesJson),
      abilitiesJson: Value(abilitiesJson),
      statsJson: Value(statsJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory PokemonDetailsEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonDetailsEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      spriteUrl: serializer.fromJson<String>(json['spriteUrl']),
      heightDm: serializer.fromJson<int>(json['heightDm']),
      weightHg: serializer.fromJson<int>(json['weightHg']),
      typesJson: serializer.fromJson<String>(json['typesJson']),
      abilitiesJson: serializer.fromJson<String>(json['abilitiesJson']),
      statsJson: serializer.fromJson<String>(json['statsJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'spriteUrl': serializer.toJson<String>(spriteUrl),
      'heightDm': serializer.toJson<int>(heightDm),
      'weightHg': serializer.toJson<int>(weightHg),
      'typesJson': serializer.toJson<String>(typesJson),
      'abilitiesJson': serializer.toJson<String>(abilitiesJson),
      'statsJson': serializer.toJson<String>(statsJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PokemonDetailsEntityData copyWith({
    int? id,
    String? name,
    String? spriteUrl,
    int? heightDm,
    int? weightHg,
    String? typesJson,
    String? abilitiesJson,
    String? statsJson,
    DateTime? updatedAt,
  }) => PokemonDetailsEntityData(
    id: id ?? this.id,
    name: name ?? this.name,
    spriteUrl: spriteUrl ?? this.spriteUrl,
    heightDm: heightDm ?? this.heightDm,
    weightHg: weightHg ?? this.weightHg,
    typesJson: typesJson ?? this.typesJson,
    abilitiesJson: abilitiesJson ?? this.abilitiesJson,
    statsJson: statsJson ?? this.statsJson,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PokemonDetailsEntityData copyWithCompanion(
    PokemonDetailsEntityCompanion data,
  ) {
    return PokemonDetailsEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      spriteUrl: data.spriteUrl.present ? data.spriteUrl.value : this.spriteUrl,
      heightDm: data.heightDm.present ? data.heightDm.value : this.heightDm,
      weightHg: data.weightHg.present ? data.weightHg.value : this.weightHg,
      typesJson: data.typesJson.present ? data.typesJson.value : this.typesJson,
      abilitiesJson: data.abilitiesJson.present
          ? data.abilitiesJson.value
          : this.abilitiesJson,
      statsJson: data.statsJson.present ? data.statsJson.value : this.statsJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonDetailsEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('spriteUrl: $spriteUrl, ')
          ..write('heightDm: $heightDm, ')
          ..write('weightHg: $weightHg, ')
          ..write('typesJson: $typesJson, ')
          ..write('abilitiesJson: $abilitiesJson, ')
          ..write('statsJson: $statsJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    spriteUrl,
    heightDm,
    weightHg,
    typesJson,
    abilitiesJson,
    statsJson,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonDetailsEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.spriteUrl == this.spriteUrl &&
          other.heightDm == this.heightDm &&
          other.weightHg == this.weightHg &&
          other.typesJson == this.typesJson &&
          other.abilitiesJson == this.abilitiesJson &&
          other.statsJson == this.statsJson &&
          other.updatedAt == this.updatedAt);
}

class PokemonDetailsEntityCompanion
    extends UpdateCompanion<PokemonDetailsEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> spriteUrl;
  final Value<int> heightDm;
  final Value<int> weightHg;
  final Value<String> typesJson;
  final Value<String> abilitiesJson;
  final Value<String> statsJson;
  final Value<DateTime> updatedAt;
  const PokemonDetailsEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.spriteUrl = const Value.absent(),
    this.heightDm = const Value.absent(),
    this.weightHg = const Value.absent(),
    this.typesJson = const Value.absent(),
    this.abilitiesJson = const Value.absent(),
    this.statsJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PokemonDetailsEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String spriteUrl,
    required int heightDm,
    required int weightHg,
    required String typesJson,
    required String abilitiesJson,
    required String statsJson,
    required DateTime updatedAt,
  }) : name = Value(name),
       spriteUrl = Value(spriteUrl),
       heightDm = Value(heightDm),
       weightHg = Value(weightHg),
       typesJson = Value(typesJson),
       abilitiesJson = Value(abilitiesJson),
       statsJson = Value(statsJson),
       updatedAt = Value(updatedAt);
  static Insertable<PokemonDetailsEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? spriteUrl,
    Expression<int>? heightDm,
    Expression<int>? weightHg,
    Expression<String>? typesJson,
    Expression<String>? abilitiesJson,
    Expression<String>? statsJson,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (spriteUrl != null) 'sprite_url': spriteUrl,
      if (heightDm != null) 'height_dm': heightDm,
      if (weightHg != null) 'weight_hg': weightHg,
      if (typesJson != null) 'types_json': typesJson,
      if (abilitiesJson != null) 'abilities_json': abilitiesJson,
      if (statsJson != null) 'stats_json': statsJson,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PokemonDetailsEntityCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? spriteUrl,
    Value<int>? heightDm,
    Value<int>? weightHg,
    Value<String>? typesJson,
    Value<String>? abilitiesJson,
    Value<String>? statsJson,
    Value<DateTime>? updatedAt,
  }) {
    return PokemonDetailsEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      spriteUrl: spriteUrl ?? this.spriteUrl,
      heightDm: heightDm ?? this.heightDm,
      weightHg: weightHg ?? this.weightHg,
      typesJson: typesJson ?? this.typesJson,
      abilitiesJson: abilitiesJson ?? this.abilitiesJson,
      statsJson: statsJson ?? this.statsJson,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (spriteUrl.present) {
      map['sprite_url'] = Variable<String>(spriteUrl.value);
    }
    if (heightDm.present) {
      map['height_dm'] = Variable<int>(heightDm.value);
    }
    if (weightHg.present) {
      map['weight_hg'] = Variable<int>(weightHg.value);
    }
    if (typesJson.present) {
      map['types_json'] = Variable<String>(typesJson.value);
    }
    if (abilitiesJson.present) {
      map['abilities_json'] = Variable<String>(abilitiesJson.value);
    }
    if (statsJson.present) {
      map['stats_json'] = Variable<String>(statsJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonDetailsEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('spriteUrl: $spriteUrl, ')
          ..write('heightDm: $heightDm, ')
          ..write('weightHg: $weightHg, ')
          ..write('typesJson: $typesJson, ')
          ..write('abilitiesJson: $abilitiesJson, ')
          ..write('statsJson: $statsJson, ')
          ..write('updatedAt: $updatedAt')
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
  late final $BookmarkEntityTable bookmarkEntity = $BookmarkEntityTable(this);
  late final $PokemonDetailsEntityTable pokemonDetailsEntity =
      $PokemonDetailsEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pokemonIndexEntity,
    cacheMetadataEntity,
    bookmarkEntity,
    pokemonDetailsEntity,
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
typedef $$BookmarkEntityTableCreateCompanionBuilder =
    BookmarkEntityCompanion Function({
      Value<int> id,
      required DateTime bookmarkedAt,
    });
typedef $$BookmarkEntityTableUpdateCompanionBuilder =
    BookmarkEntityCompanion Function({
      Value<int> id,
      Value<DateTime> bookmarkedAt,
    });

class $$BookmarkEntityTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarkEntityTable> {
  $$BookmarkEntityTableFilterComposer({
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

  ColumnFilters<DateTime> get bookmarkedAt => $composableBuilder(
    column: $table.bookmarkedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BookmarkEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarkEntityTable> {
  $$BookmarkEntityTableOrderingComposer({
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

  ColumnOrderings<DateTime> get bookmarkedAt => $composableBuilder(
    column: $table.bookmarkedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BookmarkEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarkEntityTable> {
  $$BookmarkEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get bookmarkedAt => $composableBuilder(
    column: $table.bookmarkedAt,
    builder: (column) => column,
  );
}

class $$BookmarkEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BookmarkEntityTable,
          BookmarkEntityData,
          $$BookmarkEntityTableFilterComposer,
          $$BookmarkEntityTableOrderingComposer,
          $$BookmarkEntityTableAnnotationComposer,
          $$BookmarkEntityTableCreateCompanionBuilder,
          $$BookmarkEntityTableUpdateCompanionBuilder,
          (
            BookmarkEntityData,
            BaseReferences<
              _$AppDatabase,
              $BookmarkEntityTable,
              BookmarkEntityData
            >,
          ),
          BookmarkEntityData,
          PrefetchHooks Function()
        > {
  $$BookmarkEntityTableTableManager(
    _$AppDatabase db,
    $BookmarkEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarkEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarkEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> bookmarkedAt = const Value.absent(),
              }) => BookmarkEntityCompanion(id: id, bookmarkedAt: bookmarkedAt),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime bookmarkedAt,
              }) => BookmarkEntityCompanion.insert(
                id: id,
                bookmarkedAt: bookmarkedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BookmarkEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BookmarkEntityTable,
      BookmarkEntityData,
      $$BookmarkEntityTableFilterComposer,
      $$BookmarkEntityTableOrderingComposer,
      $$BookmarkEntityTableAnnotationComposer,
      $$BookmarkEntityTableCreateCompanionBuilder,
      $$BookmarkEntityTableUpdateCompanionBuilder,
      (
        BookmarkEntityData,
        BaseReferences<_$AppDatabase, $BookmarkEntityTable, BookmarkEntityData>,
      ),
      BookmarkEntityData,
      PrefetchHooks Function()
    >;
typedef $$PokemonDetailsEntityTableCreateCompanionBuilder =
    PokemonDetailsEntityCompanion Function({
      Value<int> id,
      required String name,
      required String spriteUrl,
      required int heightDm,
      required int weightHg,
      required String typesJson,
      required String abilitiesJson,
      required String statsJson,
      required DateTime updatedAt,
    });
typedef $$PokemonDetailsEntityTableUpdateCompanionBuilder =
    PokemonDetailsEntityCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> spriteUrl,
      Value<int> heightDm,
      Value<int> weightHg,
      Value<String> typesJson,
      Value<String> abilitiesJson,
      Value<String> statsJson,
      Value<DateTime> updatedAt,
    });

class $$PokemonDetailsEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonDetailsEntityTable> {
  $$PokemonDetailsEntityTableFilterComposer({
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

  ColumnFilters<String> get spriteUrl => $composableBuilder(
    column: $table.spriteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get heightDm => $composableBuilder(
    column: $table.heightDm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weightHg => $composableBuilder(
    column: $table.weightHg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get typesJson => $composableBuilder(
    column: $table.typesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abilitiesJson => $composableBuilder(
    column: $table.abilitiesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statsJson => $composableBuilder(
    column: $table.statsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PokemonDetailsEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonDetailsEntityTable> {
  $$PokemonDetailsEntityTableOrderingComposer({
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

  ColumnOrderings<String> get spriteUrl => $composableBuilder(
    column: $table.spriteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get heightDm => $composableBuilder(
    column: $table.heightDm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weightHg => $composableBuilder(
    column: $table.weightHg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get typesJson => $composableBuilder(
    column: $table.typesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abilitiesJson => $composableBuilder(
    column: $table.abilitiesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statsJson => $composableBuilder(
    column: $table.statsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PokemonDetailsEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonDetailsEntityTable> {
  $$PokemonDetailsEntityTableAnnotationComposer({
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

  GeneratedColumn<String> get spriteUrl =>
      $composableBuilder(column: $table.spriteUrl, builder: (column) => column);

  GeneratedColumn<int> get heightDm =>
      $composableBuilder(column: $table.heightDm, builder: (column) => column);

  GeneratedColumn<int> get weightHg =>
      $composableBuilder(column: $table.weightHg, builder: (column) => column);

  GeneratedColumn<String> get typesJson =>
      $composableBuilder(column: $table.typesJson, builder: (column) => column);

  GeneratedColumn<String> get abilitiesJson => $composableBuilder(
    column: $table.abilitiesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statsJson =>
      $composableBuilder(column: $table.statsJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PokemonDetailsEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PokemonDetailsEntityTable,
          PokemonDetailsEntityData,
          $$PokemonDetailsEntityTableFilterComposer,
          $$PokemonDetailsEntityTableOrderingComposer,
          $$PokemonDetailsEntityTableAnnotationComposer,
          $$PokemonDetailsEntityTableCreateCompanionBuilder,
          $$PokemonDetailsEntityTableUpdateCompanionBuilder,
          (
            PokemonDetailsEntityData,
            BaseReferences<
              _$AppDatabase,
              $PokemonDetailsEntityTable,
              PokemonDetailsEntityData
            >,
          ),
          PokemonDetailsEntityData,
          PrefetchHooks Function()
        > {
  $$PokemonDetailsEntityTableTableManager(
    _$AppDatabase db,
    $PokemonDetailsEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonDetailsEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonDetailsEntityTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PokemonDetailsEntityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> spriteUrl = const Value.absent(),
                Value<int> heightDm = const Value.absent(),
                Value<int> weightHg = const Value.absent(),
                Value<String> typesJson = const Value.absent(),
                Value<String> abilitiesJson = const Value.absent(),
                Value<String> statsJson = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PokemonDetailsEntityCompanion(
                id: id,
                name: name,
                spriteUrl: spriteUrl,
                heightDm: heightDm,
                weightHg: weightHg,
                typesJson: typesJson,
                abilitiesJson: abilitiesJson,
                statsJson: statsJson,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String spriteUrl,
                required int heightDm,
                required int weightHg,
                required String typesJson,
                required String abilitiesJson,
                required String statsJson,
                required DateTime updatedAt,
              }) => PokemonDetailsEntityCompanion.insert(
                id: id,
                name: name,
                spriteUrl: spriteUrl,
                heightDm: heightDm,
                weightHg: weightHg,
                typesJson: typesJson,
                abilitiesJson: abilitiesJson,
                statsJson: statsJson,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PokemonDetailsEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PokemonDetailsEntityTable,
      PokemonDetailsEntityData,
      $$PokemonDetailsEntityTableFilterComposer,
      $$PokemonDetailsEntityTableOrderingComposer,
      $$PokemonDetailsEntityTableAnnotationComposer,
      $$PokemonDetailsEntityTableCreateCompanionBuilder,
      $$PokemonDetailsEntityTableUpdateCompanionBuilder,
      (
        PokemonDetailsEntityData,
        BaseReferences<
          _$AppDatabase,
          $PokemonDetailsEntityTable,
          PokemonDetailsEntityData
        >,
      ),
      PokemonDetailsEntityData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PokemonIndexEntityTableTableManager get pokemonIndexEntity =>
      $$PokemonIndexEntityTableTableManager(_db, _db.pokemonIndexEntity);
  $$CacheMetadataEntityTableTableManager get cacheMetadataEntity =>
      $$CacheMetadataEntityTableTableManager(_db, _db.cacheMetadataEntity);
  $$BookmarkEntityTableTableManager get bookmarkEntity =>
      $$BookmarkEntityTableTableManager(_db, _db.bookmarkEntity);
  $$PokemonDetailsEntityTableTableManager get pokemonDetailsEntity =>
      $$PokemonDetailsEntityTableTableManager(_db, _db.pokemonDetailsEntity);
}
