class ErrorModel {
  final bool? ok;
  final int? errorCode;
  final String? error;

  ErrorModel({this.ok, this.errorCode, this.error});

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      ok: map['ok'] as bool,
      errorCode: map['error_code'] as int,
      error: map['error'] as String,
    );
  }
}
