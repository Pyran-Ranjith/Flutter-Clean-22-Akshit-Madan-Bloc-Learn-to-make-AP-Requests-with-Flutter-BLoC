part of 'posts_bloc.dart';

@immutable
// sealed class PostsEvent {}
abstract class PostsEvent {}

class PostsInitialFechEvent extends PostsEvent{}

class PostsInitialFetchEvent extends PostsEvent{}
