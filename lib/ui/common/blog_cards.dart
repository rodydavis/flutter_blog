import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/blocs.dart';
import 'blog_card.dart';

class BlogCards extends StatelessWidget {
  const BlogCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) => BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is PostsReady) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (dimens.maxWidth / 450).ceil(),
                childAspectRatio: 9 / 16,
              ),
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: BlogCard(
                    author: post.author,
                    datePublished:
                        DateTime.fromMillisecondsSinceEpoch(post.datePublished),
                    tags: post.tags.split(','),
                    title: post.title,
                    image: post.image,
                    description: post.description,
                    onTap: () => Navigator.pushNamed(context, post.slug),
                  ),
                );
              },
            );
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
