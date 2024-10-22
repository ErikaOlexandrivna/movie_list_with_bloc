import 'package:flutter/material.dart';
import 'package:movie_list_with_bloc/const.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';
import 'package:movie_list_with_bloc/style/palette.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          blendMode: BlendMode.dstOut,
          shaderCallback: (Rect rect) {
            return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Palette.background,
                ]).createShader(rect);
          },
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              child: Image.network(
                posterPath + movie.posterPath,
                fit: BoxFit.cover,
                height: 218,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                movie.releaseDate,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        )
      ],
    );
  }
}
