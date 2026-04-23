import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bookmarks/bookmarks_repository.dart';
import '../../domain/models/pokemon_details.dart';
import '../../domain/models/pokemon_list_item.dart';
import '../../injection.dart';
import '../../widgets/error_retry_view.dart';
import 'pokemon_details_cubit.dart';
import 'pokemon_details_state.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key, required this.item});

  final PokemonListItem item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonDetailsCubit>(
      create: (_) => getIt<PokemonDetailsCubit>(param1: item.id),
      child: _View(item: item),
    );
  }
}

class _View extends StatefulWidget {
  const _View({required this.item});

  final PokemonListItem item;

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late bool _isBookmarked = widget.item.isBookmarked;

  Future<void> _toggleBookmark() async {
    final next = await getIt<BookmarksRepository>().toggleBookmark(
      id: widget.item.id,
    );
    if (!mounted) return;
    setState(() => _isBookmarked = next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        actions: [
          IconButton(
            icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            onPressed: _toggleBookmark,
          ),
        ],
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
        builder: (context, state) {
          final details = state.details;
          if (details == null) {
            if (state.error != null) {
              return ErrorRetryView(
                message: 'Failed to load details',
                onRetry: context.read<PokemonDetailsCubit>().refresh,
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: context.read<PokemonDetailsCubit>().refresh,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _HeroCard(details: details),
                const SizedBox(height: 12),
                _PhysicalCard(details: details),
                const SizedBox(height: 12),
                _AbilitiesCard(details: details),
                const SizedBox(height: 12),
                _StatsCard(details: details),
                const SizedBox(height: 48),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.details});

  final PokemonDetails details;

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: details.spriteUrl,
            height: 200,
            fit: BoxFit.contain,
            placeholder: (_, _) => const SizedBox(height: 200),
            errorWidget: (_, _, _) =>
                const Icon(Icons.image_not_supported_outlined, size: 64),
          ),
          const SizedBox(height: 8),
          Text(
            details.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: details.types.map(_typeChip).toList(),
          ),
        ],
      ),
    );
  }

  Widget _typeChip(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        _capitalize(type),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _PhysicalCard extends StatelessWidget {
  const _PhysicalCard({required this.details});

  final PokemonDetails details;

  @override
  Widget build(BuildContext context) {
    final height = (details.heightDm / 10).toStringAsFixed(1);
    final weight = (details.weightHg / 10).toStringAsFixed(1);
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Physical Attributes',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _AttrBox(label: 'Height', value: '$height m')),
              const SizedBox(width: 12),
              Expanded(child: _AttrBox(label: 'Weight', value: '$weight kg')),
            ],
          ),
        ],
      ),
    );
  }
}

class _AttrBox extends StatelessWidget {
  const _AttrBox({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _AbilitiesCard extends StatelessWidget {
  const _AbilitiesCard({required this.details});

  final PokemonDetails details;

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Abilities',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: details.abilities
                .map(
                  (a) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(_capitalize(a.replaceAll('-', ' '))),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.details});

  final PokemonDetails details;

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Base Stats',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          ...details.stats.entries.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: _StatRow(name: e.key, value: e.value),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.name, required this.value});

  final String name;
  final int value;

  @override
  Widget build(BuildContext context) {
    final pct = (value / 255).clamp(0.0, 1.0);
    return Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(_capitalize(name.replaceAll('-', ' '))),
        ),
        SizedBox(width: 40, child: Text('$value')),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 8,
              backgroundColor: Colors.deepPurple.shade50,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }
}

String _capitalize(String s) =>
    s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';