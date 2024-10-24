import 'package:flutter/material.dart';
import 'package:movie_list_with_bloc/model/credits_model.dart';

class Credits extends StatelessWidget {
  final List<CreditsModel> credits;

  const Credits({super.key, required this.credits});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: credits.length,
        itemBuilder: (context, index) {
          return _buildActorCard(credits[index]);
        },
      ),
    );
  }

  Widget _buildActorCard(CreditsModel actor) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network(
              actor.profile_path != null
                  ? 'https://image.tmdb.org/t/p/w500${actor.profile_path}'
                  : 'Dont have photo',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            actor.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            actor.original_name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
