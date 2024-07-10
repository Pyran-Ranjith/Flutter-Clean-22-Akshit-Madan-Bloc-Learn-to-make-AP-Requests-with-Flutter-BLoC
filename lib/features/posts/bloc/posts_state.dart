part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

abstract class PostsActionState extends PostsState{}

final class PostsInitial extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;

  PostFetchingSuccessfulState({
    required this.posts,
    });
}
