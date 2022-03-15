import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvvm/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<Post>> getPosts() async {
    final String url = '${dotenv.get("BASE_URL")}/posts';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return postFromJson(response.body);
      }
      return [];
    } on HttpException {
      print("No internet connection");
      return [];
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
