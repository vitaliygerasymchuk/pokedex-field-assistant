# Pokédex Field Assistant

Coding Challenge — Flutter Pokédex app backed by PokeAPI, with offline-first caching.

## Notes

This app demonstrates my approach to Flutter: offline-first, stream-based data management, cleanly separated from the UI inside repositories that talk to the UI through Cubits.

PokeAPI has no name-search endpoint (see https://github.com/PokeAPI/pokeapi/issues/474), so the decision was to cache the full pokémon index locally and filter there. A TTL gates refreshes (1 h for the list, 24 h for per-pokémon details), and every screen exposes pull-to-refresh for force-refresh.

The app is offline-friendly. The pokemon details are cached upon entering the page (without the internet if not cached will show the corresponding state with Retry button).

Also, due to the luck of time - i didn't cover anything with unit/ui tests. But this is easy doable, because core data layers are interfaced and can be mocked.

Things to improve:
1) Remember scroll state of the tabs
2) Add auth (Firebase already connected)
3) Unit test
4) UI test

## Requirements

- Flutter ≥ 3.38 (Dart ≥ 3.11)
- JDK 17 (Android) — the project's `compileOptions` target Java 17
- Xcode + CocoaPods (iOS, macOS only)

Verify with `flutter doctor`.

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

Re-run codegen whenever a Drift table or an `@injectable` class changes. Use `watch` during active development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### Android release signing (optional — debug works without it)

Place these files (gitignored) to build release APK/AAB:

- `android/pokedex.jks`
- `android/key.properties`:
  ```properties
  storePassword=<password>
  keyPassword=<password>
  keyAlias=pokedesk
  storeFile=../pokedex.jks
  ```

## Run

```bash
flutter run                      # debug on the first available device
flutter run --release            # release (Android needs signing setup above)
```

Release artifacts:
```bash
flutter build apk --release      # build/app/outputs/flutter-apk/
flutter build appbundle --release
flutter build ios --release
```

## Architecture

MVVM with immutable state (cubit emits one `*State` per change; widgets re-render via `BlocBuilder`).

- **Model** — `lib/data/` (repositories, Drift DB) + `lib/domain/` (models, `Result<T>`, `WeatherToTypeMapper`).
- **ViewModel** — Cubits in `lib/features/**/**_cubit.dart`.
- **View** — widgets in `lib/features/**/**_screen.dart` and `**_tab.dart`.

Data flow:
- API-touching methods return `Future<Result<T>>`; DB-backed reads are plain `Stream<T>`.
- Writes go through the repo → Drift; Drift's `.watch()` streams fan out updates to every listener (search list, bookmarks tab, details screen).
- `syncAll` / `syncDetails` are TTL-gated against `cache_metadata_entity`; `force: true` bypasses the TTL.

## Libraries

Runtime:

| Package | Role |
|---|---|
| `get_it` | service locator |
| `injectable` | annotation-based DI registration |
| `dio` | HTTP client |
| `drift`, `drift_flutter` | local SQLite with codegen; `drift_flutter` opens the DB at the platform-appropriate path |
| `path_provider`, `path` | resolve the app documents dir for the DB file |
| `flutter_bloc` | Cubit + `BlocProvider` / `BlocBuilder` (Cubit-only, no events) |
| `cached_network_image` | in-memory + disk image cache |

Dev:

- `build_runner`, `injectable_generator`, `drift_dev` — codegen
- `flutter_lints` — lints

## Troubleshooting

- Drift fails to open DB on emulator after schema change → wipe app data (schema is pinned at v1, no migrations).
- CocoaPods version mismatch on iOS → `cd ios && pod repo update && pod install`.
- Kotlin/Gradle JVM mismatch → ensure `JAVA_HOME` points to JDK 17.
