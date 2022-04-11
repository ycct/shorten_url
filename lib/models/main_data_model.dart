import 'package:shorten_url/models/result_model.dart';

class MainDataModel {
  final bool? status;
  final ResultModel? result;

  MainDataModel({required this.status, required this.result});


  factory MainDataModel.fromMap(Map<String, dynamic> map) {
    return MainDataModel(
      status: map['ok'] as bool,
      result: ResultModel.fromMap(map["result"]),
    );
  }
}
