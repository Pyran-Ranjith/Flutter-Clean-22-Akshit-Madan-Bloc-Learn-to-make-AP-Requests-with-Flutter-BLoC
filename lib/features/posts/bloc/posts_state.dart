part of 'posts_bloc.dart';

// @immutable
// sealed class PostsState {}
abstract class PostsState {}

// final class PostsInitial extends PostsState {}
class PostsInitial extends PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsFetchingLoadingState extends PostsState {}

class PostsFetchingErrorState extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;

  PostFetchingSuccessfulState({
    required this.posts,
  });
}

class PostAdditionSuccessState extends PostsActionState{

}

class PostAdditionErrorState extends PostsActionState{
  
}
