import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/blog/blog.dart';
import '../../domain/blog/i_blog_repository.dart';
import '../core/urls.dart';
import 'blog_api.dart';

@prod
@Injectable(as: IBlogRepository)
class BlogRepository implements IBlogRepository {
  final BlogApi _blogApi = BlogApi('$blogProductionUrl/index.json');

  @override
  Future<Blog> getBlogData() async {
    try {
      final data = await _blogApi.fetchData();
      final blog = Blog.fromJson(data);
      return blog;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
