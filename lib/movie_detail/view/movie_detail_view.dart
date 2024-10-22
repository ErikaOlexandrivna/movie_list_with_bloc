import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list_with_bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_list_with_bloc/movie_detail/view/components/background_image_with_gradient.dart';
import 'package:movie_list_with_bloc/movie_detail/view/components/movie_info.dart';
import 'package:movie_list_with_bloc/movie_detail/view/components/treiler.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(builder: (context, state) {
      if (state.loadingStatus == LoadingStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.loadingStatus == LoadingStatus.success) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 450,
              // pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: BackgroundImageWithGradient(movie: state.movieDetail!),
              ),
            ),
            SliverToBoxAdapter(child: MovieInfo(movie: state.movieDetail!)),
            SliverToBoxAdapter(child: Trailer(trailers: state.trailers!,))
          ],
        );
      } else {
        return const Center(
          child: Text('Opps!'),
        );
      }
    });
  }
}
