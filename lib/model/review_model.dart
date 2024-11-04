class ReviewModel {
  final String author;
  final String? avatarPath;
  final double rating;

  ReviewModel({
    required this.author,
    required this.avatarPath,
    required this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      author: json['author'],
      avatarPath: json['author_details']['avatar_path'] ?? '',
      rating: json['author_details']['rating'].toDouble(),
    );
  }
}
