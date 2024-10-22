import 'package:flutter/material.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';
import 'package:movie_list_with_bloc/style/palette.dart';

class MovieInfo extends StatelessWidget {
  final MovieModel movie;

  const MovieInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.background,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(movie.releaseDate),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Palette.textPrimary),
                ),
                child: const Text('16 +'),
              ),
              const SizedBox(width: 10,),
              if (movie.genreList != null) SizedBox(
                height: 25,
                child: ListView.separated(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const VerticalDivider(
                        color: Palette.textPrimary,
                        width: 20,
                        indent: 5,
                        endIndent: 5,
                      );
                    },
                    itemCount: movie.genreList!.length,
                  itemBuilder: (context, index) {
                      return Text(movie.genreList![index].name);
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text('Обзор', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 20,
          ),
          Text(movie.overview),
        ],
      ),
    );
  }
}
