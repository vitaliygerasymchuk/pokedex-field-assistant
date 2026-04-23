import 'package:drift/drift.dart';

class PokemonDetailsEntity extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get spriteUrl => text()();
  IntColumn get heightDm => integer()();
  IntColumn get weightHg => integer()();
  TextColumn get typesJson => text()();
  TextColumn get abilitiesJson => text()();
  TextColumn get statsJson => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}