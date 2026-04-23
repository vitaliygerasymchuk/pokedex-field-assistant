import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/pokemon_list_item.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    super.key,
    required this.item,
    required this.onToggleBookmark,
    this.onTap,
  });

  final PokemonListItem item;
  final VoidCallback onToggleBookmark;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: item.spriteUrl,
        width: 48,
        height: 48,
        fit: BoxFit.contain,
        placeholder: (_, _) => const SizedBox(width: 48, height: 48),
        errorWidget: (_, _, _) =>
            const Icon(Icons.image_not_supported_outlined),
      ),
      title: Text(item.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('#${item.id.toString().padLeft(3, '0')}'),
          IconButton(
            icon: Icon(
              item.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: item.isBookmarked ? Colors.deepPurple : null,
            ),
            onPressed: onToggleBookmark,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}