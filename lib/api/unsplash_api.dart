// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class UnsplashApi{
//   final String apiKey;
//   final String baseUrl = 'https://unsplash.com/';
//
//   UnsplashApi(this.apiKey);
//
//   Future<List<Map<String, dynamic>>> fetchWallpapers({int page = 1, int perPage = 10}) async{
//     final response = await http.get(
//       '$baseUrl/photos',
//       headers: {'Authorization': 'Client-ID $apiKey'},
//     );
//
//     if (response.statusCode == 200){
//       final List<dynamic> data = json.decode(response.body);
//       return List<Map<String, dynamic>>.from(data);
//     }else{
//       throw Exception('Failed to load wallpapers');
//     }
//   }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';

class UnsplashApi {
  final String apiKey;
  final String baseUrl = 'https://api.unsplash.com';

  UnsplashApi(this.apiKey);

  Future<List<Map<String, dynamic>>> fetchWallpapers({int page = 1, int perPage = 10}) async {
    final Uri uri = Uri.parse('$baseUrl/photos?page=$page&per_page=$perPage');

    final response = await http.get(
      uri,
      headers: {'Authorization': 'Client-ID $apiKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load wallpapers');
    }
  }
}
