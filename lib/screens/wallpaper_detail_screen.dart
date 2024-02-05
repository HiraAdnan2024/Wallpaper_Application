import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/wallpapers.dart';

class WallpaperDetailScreen extends StatelessWidget{
  final Wallpaper wallpaper;


  WallpaperDetailScreen ({
    required this.wallpaper
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            wallpaper.url,
            height: 300.0, // adjust as neended
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Photographer: ${wallpaper.photographer}',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}