

class CreditsModel{
  final String profile_path;
 final String name;
 final String original_name;




CreditsModel({required this.profile_path,required this.name,required this.original_name});


  factory CreditsModel.fromJson(Map<String, dynamic> json) {
    return CreditsModel(
      profile_path: json['profile_path'] ?? 'Please search photo in Google',
      name: json['name'] ?? ''  ,
      original_name: json['name']?? '',
    );
  }


 }