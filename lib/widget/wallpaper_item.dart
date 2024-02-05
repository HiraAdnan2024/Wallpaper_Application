import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newwallpaper/widget/skeleton_loader.dart';

class WallpaperItem extends StatelessWidget {
  final String imageUrl;
  final String photographer;

  WallpaperItem({required this.imageUrl, required this.photographer});

  @override
  Widget build(BuildContext context) {
    print('Image URL: $imageUrl');
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            height: 200.0,
            placeholder: (context, url) => SkeletonLoader(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Photographer: $photographer'),
          ),
        ],
      ),
    );
  }
}
