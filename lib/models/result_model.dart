class ResultModel {
  final String fullShortLink;
  final String shortLink;
  final String originalLink;

  ResultModel({required this.fullShortLink, required this.shortLink,required this.originalLink});


  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      originalLink: map["original_link"],
      fullShortLink: map['full_short_link'] as String,
      shortLink: map['short_link'] as String,
    );
  }
}