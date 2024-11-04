import 'package:flutter/material.dart';

import '../../../model/review_model.dart';


class Reviews extends StatelessWidget {
  final List<ReviewModel> reviews;

  const Reviews({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return _buildReviewCard(reviews[index]);
        },
      ),
    );
  }

  Widget _buildReviewCard(ReviewModel review) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                review.avatarPath != null && review.avatarPath!.isNotEmpty
                    ? 'https://image.tmdb.org/t/p/w500${review.avatarPath}'
                    : 'assets/images/default_avatar.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.author,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('Рейтинг: ${review.rating.toString()}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
