import 'package:flutter/material.dart';

import '../../model/image_mode.dart';

class ImageDetailScreen extends StatelessWidget {
  final ImageModel image;

  const ImageDetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image.tags.isNotEmpty ? image.tags.split(', ').first : 'Image Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Size Image
            Hero(
              tag: 'image-${image.id}', // Unique tag for Hero animation
              child: Image.network(
                image.fullImageUrl,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.broken_image, size: 60, color: Colors.grey));
                },
              ),
            ),
            const SizedBox(height: 20),
            // User Information
            Row(
              children: [
                const Icon(Icons.person, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Photographer: ${image.photographerName}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Tags
            if (image.tags.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tags:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: image.tags.split(', ').map((tag) {
                      return Chip(
                        label: Text(tag.trim()),
                      );
                    }).toList(),
                  ),
                ],
              ),
            const SizedBox(height: 12),
            // Likes and Downloads
            Row(
              children: [
                const Icon(Icons.favorite_border, color: Colors.red),
                const SizedBox(width: 8),
                Text(image.formattedLikes, style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 20),
                const Icon(Icons.download_outlined, color: Colors.blue),
                const SizedBox(width: 8),
                Text(image.formattedDownloads, style: const TextStyle(fontSize: 14)),
              ],
            ),
            // You can add more details here if needed (views, comments, etc.)
          ],
        ),
      ),
    );
  }
}