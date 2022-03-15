import 'package:flutter/material.dart';
import 'package:mvvm/providers/posts_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const route = "/";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<PostsProvider>(context).loadPosts();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Provider.of<PostsProvider>(context).posts.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: Provider.of<PostsProvider>(context).posts.length,
                itemBuilder: (_, index) {
                  final post = Provider.of<PostsProvider>(context).posts[index];
                  return ListTile(
                    leading: Text(post.id.toString()),
                    title: Text(post.title ?? ""),
                  );
                }),
      ),
    );
  }
}
