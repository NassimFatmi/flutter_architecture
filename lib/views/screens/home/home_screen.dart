import 'package:flutter/material.dart';
import '../../../models/notifier_state.dart';
import '../../../providers/posts_provider.dart';
import '../../widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const route = "/";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // call the function to get the data
    Provider.of<PostsProvider>(context, listen: false).loadPosts();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<PostsProvider>(builder: (ctx, postsProvider, __) {
          // Si le statut est Loading => afficher un Progress Indicator
          if (postsProvider.state == NotifierState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else
          // si il y a un erreur => afficher une snackbar avec le message d'erreur
          if (postsProvider.failure != null) {
            Future.delayed(Duration.zero, () {
              errorSnackBar(context, postsProvider.failure.toString());
            });

            return Text(postsProvider.failure.toString());
          } else {
            // si il n'y a pas d'erreur => afficher la liste des posts
            return ListView.builder(
                itemCount: postsProvider.posts.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(postsProvider.posts[index].title ?? ""),
                  );
                });
          }
        }),
      ),
    );
  }
}
