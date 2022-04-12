import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shorten_url/constants/service.dart';
import 'package:shorten_url/models/error_model.dart';
import 'package:shorten_url/models/main_data_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController urlController = TextEditingController();
  MainDataModel? mainDataModel;
  List<MainDataModel> shortenList = [];
  List<MainDataModel> reversedShortenList = [];
  ErrorModel? errorModel;
  bool isFormEmpty = false;
  List<bool> isCopiedList = [];



  Future<MainDataModel?> shortenUrl() async {
    Uri serviceUri = Uri.parse(Service.baseUrl + urlController.text);
    http.Response response = await http.get(
      serviceUri,
    );
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    try {
      mainDataModel = MainDataModel.fromMap(responseMap);
      if (mainDataModel != null) {
        shortenList.add(mainDataModel!);
        reversedShortenList = shortenList.reversed.toList();
        isCopiedList.add(false);
      }
      update();
      return mainDataModel;
    } catch (e) {
      errorModel = ErrorModel.fromMap(responseMap);
      if (errorModel != null) {
        Get.snackbar("Error", errorModel!.error ?? "Error Occur",
            backgroundColor: Colors.red.shade400, colorText: Colors.white);
      }
    }
    return null;
  }

  void copiedMethod(List list, int index) async {
    list[index] = true;
    update();
    await Future.delayed(const Duration(seconds: 2));
    list[index] = false;
    update();
  }

  void formValidatorChanger() {
    isFormEmpty = true;
    update();
  }

  void deleteFromList(List list, int index) {
    list.removeAt(index);
    update();
  }

}
