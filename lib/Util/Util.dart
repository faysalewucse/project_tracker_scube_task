import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import '../Helper/Constant.dart';

void showApiErrorMessage(response) {
  var getStorage = GetStorage();
  if (response is DioException) {
    if (response.type == DioExceptionType.connectionTimeout) {
      showMessage('Connection Timeout');
    } else if (response.type == DioExceptionType.receiveTimeout) {
      showMessage('Receive Timeout');
    } else if (response.type == DioExceptionType.badResponse) {
      if (response.response?.statusCode == 400) {
        showMessage(response.response?.data["message"]);
      } else if (response.response?.statusCode == 401) {
        showMessage(response.response?.data["message"]);
        getStorage.write(AUTH_TOKEN, "");
      } else if (response.response?.statusCode == 403) {
        showMessage(response.response?.data["message"]);
        getStorage.write(AUTH_TOKEN, "");
      } else {
        showMessage(response.response?.data["message"].toString());
      }
    } else if (response.type == DioExceptionType.sendTimeout) {
      showMessage('Send Timeout');
    } else if (response.type == DioExceptionType.cancel) {
      showMessage('Request Cancelled');
    } else if (response.message!.contains("SocketException")) {
      showMessage("No internet connection");
    } else {
      showMessage(response.message);
    }
  } else {
    showMessage(response.toString());
  }
}

void showMessage(String? msg, {bool isSuccess = false}) {
  Get.snackbar(
    isSuccess ? "Success!" : "Error!",
    msg ?? "Error Occurred",
    backgroundColor: isSuccess == true ? GREEN : ERROR_500,
    snackPosition: SnackPosition.BOTTOM,
    colorText: WHITE,
    borderRadius: 2.0,
    icon: Icon(
      isSuccess ? PhosphorIcons.check_circle_bold : PhosphorIcons.info,
      size: 30,
      color: WHITE,
    ),
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
  );
}

Locale getInitialLocal() {
  final localStorage = GetStorage();
  String code = localStorage.read(BANGLA);
  switch (code) {
    case ENGLISH:
      {
        return const Locale("en", "US");
      }
    case BANGLA:
      {
        return const Locale("bn", "BD");
      }
  }
  return const Locale("en", "US");
}

String getAuthToken() {
  var storage = GetStorage();
  return '${storage.read(AUTH_TOKEN)}';
}