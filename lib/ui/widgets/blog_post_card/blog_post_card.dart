import 'package:flutter/material.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:fun_with_flutter/repository/url_repository.dart' as url_repository;
import 'package:fun_with_flutter/plugins/url_launcher/url_launcher.dart';

class BlogPostCard extends StatelessWidget {
  const BlogPostCard({Key key, this.post}) : super(key: key);
  final PostData post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UrlUtils.open(post.uri);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    post.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                const Divider(),
                Expanded(
                  child: Image.network(
                    url_repository.blogThumbnailUrl(post.thumbnail),
                    fit: BoxFit.contain,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints:
                        const BoxConstraints(minHeight: 20, maxHeight: 20),
                    child: Text(
                      post.description,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}