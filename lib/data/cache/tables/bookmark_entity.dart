import 'package:drift/drift.dart';

class BookmarkEntity extends Table {
  IntColumn get id => integer()();
  DateTimeColumn get bookmarkedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}