class ResultModel {
  final String fullShortLink;
  final String shortLink;

  ResultModel({required this.fullShortLink, required this.shortLink});


  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      fullShortLink: map['full_short_link'] as String,
      shortLink: map['short_link'] as String,
    );
  }
}