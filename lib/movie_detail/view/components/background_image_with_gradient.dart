import 'package:flutter/material.dart';
import 'package:movie_list_with_bloc/const.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';
import 'package:movie_list_with_bloc/style/palette.dart';

class BackgroundImageWithGradient extends StatelessWidget {
  final MovieModel movie;

  const BackgroundImageWithGradient({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          posterPath + movie.posterPath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
            Colors.transparent,
            Palette.background,
          ])),
        )
      ],
    );
  }
}
