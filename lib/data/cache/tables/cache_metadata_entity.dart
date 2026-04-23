import 'package:drift/drift.dart';

class CacheMetadataEntity extends Table {
  TextColumn get cacheKey => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {cacheKey};
}