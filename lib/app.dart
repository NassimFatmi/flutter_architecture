import 'package:flutter/material.dart';
import 'package:mvvm/providers/posts_provider.dart';
import 'package:provider/provider.dart';
import 'config/routes/routes.dart';
import 'config/theme/theme.dart';

class MVVMApp extends StatelessWidget {
  const MVVMApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PostsProvider())],
      child: MaterialApp(
        title: 'Gacela',
        theme: GacelaTheme.gacelaTheme,
        routes: Routes.routes,
        initialRoute: "/login",
      ),
    );
  }
}
