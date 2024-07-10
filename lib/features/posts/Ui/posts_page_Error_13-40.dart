// ignore_for_file: prefer_const_constructors, type_literal_in_constant_pattern, avoid_unnecessary_containers, annotate_overrides

import 'package:fc_22_akshit_madan_bloc_api_requests_app/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialFechEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Posts Page')),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (prevous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is! PostsActionState,
        listener: (context, state) {},
        builder: (context, state) {
            switch (state.runtimeType) {
              // case PostsFetchingLoadingState:
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              case PostFetchingSuccessfulState:
                final successState = state as PostFetchingSuccessfulState;

                return Container(
                  child: Center(child: Text('HHHHHHHHHH')),
                  // child: ListView.builder(
                  //   itemCount: successState.posts.length,
                  //   itemBuilder: (context, index) {
                  //     return Container(
                  //       color: Colors.grey.shade200,
                  //       padding: const EdgeInsets.all(16),
                  //       margin: const EdgeInsets.all(16),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(successState.posts[index].title),
                  //           Text(successState.posts[index].body)
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                );
              default:
                return const SizedBox();
            }
          // return Container(
          //   child: ListView.builder(itemCount: successState.posts.length,),
          // );
        },
      ),
    );
  }
}
