import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../pokemon_details/pokemon_details_screen.dart';
import '../../widgets/pokemon_tile.dart';
import 'bookmarks_cubit.dart';
import 'bookmarks_state.dart';

class BookmarksTab extends StatelessWidget {
  const BookmarksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarksCubit>(
      create: (_) => getIt<BookmarksCubit>(),
      child: const _BookmarksTabView(),
    );
  }
}

class _BookmarksTabView extends StatelessWidget {
  const _BookmarksTabView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null && state.items.isEmpty) {
            return const Center(child: Text('Failed to load bookmarks'));
          }
          if (state.items.isEmpty) {
            return const Center(child: Text('No bookmarks yet'));
          }
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: state.items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (_, i) {
              final item = state.items[i];
              return PokemonTile(
                item: item,
                onToggleBookmark: () =>
                    context.read<BookmarksCubit>().toggleBookmark(item),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => PokemonDetailsScreen(item: item),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}