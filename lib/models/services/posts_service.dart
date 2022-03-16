import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../errors/failure.dart';
import '../post_model.dart';

class PostService {
  Future<List<Post>> getPosts() async {
    final String url = '${dotenv.get("BASE_URL")}/posts';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return postFromJson(response.body);
      }
      return [];
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    } catch (e) {
      print(e);
      throw Failure(e.toString());
    }
  }
}
