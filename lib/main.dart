import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list_with_bloc/bloc%20_observer.dart';
import 'package:movie_list_with_bloc/data_base/data_base_service/movie_data_base.dart';
import 'package:movie_list_with_bloc/movie_list/view/movie_list_page.dart';
import 'package:movie_list_with_bloc/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final movieDataBase = MovieDataBase.instance;
  await movieDataBase.init();
  Bloc.observer = MovieObserver();
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
