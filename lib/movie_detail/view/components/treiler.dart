import 'package:flutter/material.dart';
import 'package:movie_list_with_bloc/model/treirel_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Trailer extends StatelessWidget {
  final List<TrailerModel> trailers;

  const Trailer({super.key, required this.trailers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Trailers'),
        SizedBox(
          height: 300,
          child: PageView.builder(
              itemCount: trailers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  width: MediaQuery.of(context).size.width * 0.97,
                  child: _videoTrailer(trailers[index]),
                );
              }),
        )
      ],
    );
  }

  Widget _videoTrailer(TrailerModel trailer) {
    return Scaffold(
      body: SizedBox(
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: trailer.key,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ),
            ),
            builder: (context, player) => player),
      ),
    );
  }
}
