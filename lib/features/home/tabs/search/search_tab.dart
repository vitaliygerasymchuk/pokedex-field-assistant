import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../../widgets/error_retry_view.dart';
import '../../../pokemon_details/pokemon_details_screen.dart';
import '../../widgets/pokemon_tile.dart';
import 'search_cubit.dart';
import 'search_state.dart';
import 'weather_picker_dialog.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (_) => getIt<SearchCubit>(),
      child: const _SearchTabView(),
    );
  }
}

class _SearchTabView extends StatefulWidget {
  const _SearchTabView();

  @override
  State<_SearchTabView> createState() => _SearchTabViewState();
}

class _SearchTabViewState extends State<_SearchTabView> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      context.read<SearchCubit>().loadMore();
    }
  }

  Future<void> _pickWeather(BuildContext context) async {
    final cubit = context.read<SearchCubit>();
    final pick = await WeatherPickerDialog.show(context);
    if (pick == null) return;
    cubit.applyWeather(
      temperatureCelsius: pick.temperatureCelsius,
      windSpeedMps: pick.windSpeedMps,
    );
  }

  Widget _buildListBody(BuildContext context, SearchState state) {
    if (state.isLoading && state.items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: const [
          SizedBox(height: 120),
          Center(child: CircularProgressIndicator()),
        ],
      );
    }
    if (state.error != null && state.items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 120),
          ErrorRetryView(
            message: 'Failed to load Pokémon',
            onRetry: context.read<SearchCubit>().refresh,
          ),
        ],
      );
    }
    if (state.items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: const [
          SizedBox(height: 120),
          Center(child: Text('No Pokémon found')),
        ],
      );
    }
    final showSpinner = state.isLoadingMore && !state.hasReachedMax;
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: state.items.length + (showSpinner ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        if (i >= state.items.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final item = state.items[i];
        return PokemonTile(
          item: item,
          onToggleBookmark: () =>
              context.read<SearchCubit>().toggleBookmark(item),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => PokemonDetailsScreen(item: item),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search Pokémon...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: context.read<SearchCubit>().setQuery,
          ),
          const SizedBox(height: 12),
          BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (a, b) => a.weatherFilter != b.weatherFilter,
            builder: (context, state) {
              final filter = state.weatherFilter;
              if (filter == null) {
                return ActionChip(
                  avatar: const Icon(Icons.cloud_outlined, size: 18),
                  label: const Text('Suggest by Weather'),
                  onPressed: () => _pickWeather(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                );
              }
              return InputChip(
                avatar: const Icon(Icons.cloud, size: 18),
                label: Text('Weather: ${filter.type}'),
                onDeleted: context.read<SearchCubit>().clearWeather,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: context.read<SearchCubit>().refresh,
                  child: _buildListBody(context, state),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
