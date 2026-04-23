import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/strings.dart';
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
    final shape = BorderRadius.circular(16);
    return Material(
      color: Colors.white,
      borderRadius: shape,
      child: InkWell(
        borderRadius: shape,
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: shape,
            border: Border.all(color: Colors.grey.shade200),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  imageUrl: item.spriteUrl,
                  fit: BoxFit.contain,
                  placeholder: (_, _) => const SizedBox.expand(),
                  errorWidget: (_, _, _) =>
                      const Icon(Icons.image_not_supported_outlined),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name.capitalized,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '#${item.id.toString().padLeft(3, '0')}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.deepPurple.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  item.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: item.isBookmarked ? Colors.deepPurple : null,
                ),
                onPressed: onToggleBookmark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
