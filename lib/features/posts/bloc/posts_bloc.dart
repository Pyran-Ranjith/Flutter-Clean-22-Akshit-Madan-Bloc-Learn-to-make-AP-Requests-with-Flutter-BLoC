// ignore_for_file: avoid_print, empty_catches, invalid_use_of_visible_for_testing_member, unused_local_variable
// Flow: event -> bloc ->

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fc_22_akshit_madan_bloc_api_requests_app/features/posts/models/post_data_ui_model.dart';
import 'package:fc_22_akshit_madan_bloc_api_requests_app/features/posts/repos/posts_repo.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFechEvent>(postsInitialFechEvent);
    on<PostsAddEvent>(postsAddEvent);
  }

  FutureOr<void> postsInitialFechEvent(
      PostsInitialFechEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await PostsRepo.fetchPosts();
    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> postsAddEvent(
      PostsAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPosts();
    // print(success);
    if (success) {
      emit(PostAdditionSuccessState());
    } else {
      emit(PostAdditionErrorState());
    }
  }
}
