class CreditsModel {
  final String? profilePath;
  final String? name;
  final String? originalName;

  CreditsModel({required this.profilePath, required this.name, required this.originalName});

  factory CreditsModel.fromJson(Map<String, dynamic> json) {
    return CreditsModel(
      profilePath: json['profile_path'],
      name: json['character'],
      originalName: json['name'],
    );
  }
}
