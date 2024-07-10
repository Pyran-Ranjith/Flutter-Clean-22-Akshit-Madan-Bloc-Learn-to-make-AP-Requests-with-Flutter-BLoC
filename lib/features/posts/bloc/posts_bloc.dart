// ignore_for_file: avoid_print, empty_catches
// Flow: event -> bloc ->
import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fc_22_akshit_madan_bloc_api_requests_app/features/posts/models/post_data_ui_model.dart';
// import 'package:fc_22_akshit_madan_bloc_api_requests_app/features/posts/repos/posts_repo.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFechEvent>(postsInitialFechEvent);
    // on<PostAddEvent>(postAddEvent);
  }

  // FutureOr<void> postsInitialFetchEvent(
      // PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    // emit(PostsFetchingLoadingState());
    // List<PostDataUiModel> posts = await PostsRepo.fetchPosts();

    // emit(PostFetchingSuccessfulState(posts: posts));
  // }

  // FutureOr<void> postAddEvent(
  //     PostAddEvent event, Emitter<PostsState> emit) async {
  //   bool success = await PostsRepo.addPost();
  
  //   if (success) {
  //     emit(PostsAdditionSuccessState());
  //   } else {
  //     emit(PostsAdditionErrorState());
  //   }
  // }

  FutureOr<void> postsInitialFechEvent(PostsInitialFechEvent event, Emitter<PostsState> emit) async{
    var client = http.Client();
    try {
      var response = await client
          .get(
            Uri.parse('https://jsonplaceholder.typicode.com/posts')
            );
  // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  // var uri = Uri.parse(decodedResponse['uri'] as String);
      print(response.body);

      // List result = jsonDecode(response.body);

      // for (int i = 0; i < result.length; i++) {
      //   PostDataUiModel post =
      //       PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
      //   posts.add(post);
      // }

      // print(posts);

      // emit(PostFetchingSuccessfullState(posts: posts));
     } 
     catch (e) {
      log(e.toString());
    }
  }
}
