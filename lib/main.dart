import 'package:flutter/material.dart';
import 'package:movie_list_with_bloc/movie_list/view/movie_list_page.dart';
import 'package:movie_list_with_bloc/style/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MovieListPage(),
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
