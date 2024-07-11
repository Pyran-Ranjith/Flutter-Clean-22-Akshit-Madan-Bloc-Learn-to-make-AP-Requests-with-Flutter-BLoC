// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:fc_22_akshit_madan_bloc_api_requests_app/features/posts/models/post_data_ui_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataUiModel>> fetchPosts() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      return (posts);
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPosts() async {
    var client = http.Client();
    // List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": "Akshit is a Flutter Teacher",
        "body": "Akshit makes good Bloc videos",
        "useid": "34",
      });

      // List result = jsonDecode(response.body);

      // for (int i = 0; i < result.length; i++) {
      //   PostDataUiModel post =
      //       PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
      //   posts.add(post);
      // }

      if (response.statusCode >= 200 && response.statusCode > 300) {
        return true;
      } else {
        return false;
      }
      // return (posts);
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
