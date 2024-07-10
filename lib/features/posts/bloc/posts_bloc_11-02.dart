// ignore_for_file: avoid_print, empty_catches

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fc_22_akshit_madan_bloc_api_requests_app/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFechEvent>(postsInitialFechEvent);
  }

  FutureOr<void> postsInitialFechEvent(
      PostsInitialFechEvent event, Emitter<PostsState> emit) async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      // print(response.body);

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      print(posts);

      emit(PostFetchingSuccessfullState(posts: posts));
    } catch (e) {
      log(e.toString());
    }
  }
}
