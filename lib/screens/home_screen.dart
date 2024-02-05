import 'package:flutter/material.dart';
import '../api/unsplash_api.dart';
import '../models/wallpapers.dart';
import '../widget/skeleton_loader.dart';
import '../widget/wallpaper_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UnsplashApi _unsplashApi = UnsplashApi('NfXtH-Fef0kXU2kyKXOfNUR2zOnbX1ka84WcevI4Snk');
  late List<Wallpaper> wallpapers;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWallpapers();
  }

  Future<void> _loadWallpapers() async {
    try {
      final List<Map<String, dynamic>> data = await _unsplashApi.fetchWallpapers(perPage : 5);
      print('API Response: $data');
      setState(() {
        wallpapers = data.map((item) {
          return Wallpaper(
            id: item['id'],
            url: item['urls']['regular'],
            photographer: item['user']['name'],
          );
        }).toList();
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper App'),
      ),
      body: isLoading
          ? Center(child: SkeletonLoader())// Skeleton loader
          : ListView.builder(
        itemCount: wallpapers.length,
        itemBuilder: (context, index) {
          final wallpaper = wallpapers[index];
          return WallpaperItem(
            imageUrl: wallpaper.url,
            photographer: wallpaper.photographer,
          );
        },
      ),
    );
  }
}
