import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shorten_url/constants/service.dart';
import 'package:shorten_url/models/error_model.dart';
import 'package:shorten_url/models/main_data_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController urlController = TextEditingController();
  MainDataModel? mainDataModel;
  ErrorModel? errorModel;
  bool isFormEmpty = false;

  @override
  void onInit() {
    super.onInit();
    urlController = TextEditingController();
  }

  @override
  void onClose() {
    urlController.dispose();
  }

  void boolChanger() {
    isFormEmpty = true;
    update();
  }

  Future<MainDataModel?> shortenUrl() async {
    Uri serviceUri = Uri.parse(Service.baseUrl + urlController.text);
    http.Response response = await http.get(
      serviceUri,
    );
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    try {
      mainDataModel = MainDataModel.fromMap(responseMap);
      if (mainDataModel != null) {
      }
      update();
      return mainDataModel;
    } catch (e) {
      errorModel = ErrorModel.fromMap(responseMap);
    }
    return null;
  }
}
