import 'dart:async';
import 'dart:io';

import '../utils/logger.dart';
import '../widgets/global_snackbar.dart';
import 'api_exception.dart';

void handleException(dynamic error) {
  if (error is ApiException) {
    if (error.statusCode == 401) {
      globalSnackBar(
        title: "Error1",
        message: "Unauthorized access. Please log in again.",
      );
    } else if (error.statusCode == 404) {
      globalSnackBar(title: "Error!", message: "Requested resource not found.");
    } else if (error.statusCode == 500) {
      globalSnackBar(
        title: "Error!",
        message: "Something went wrong! Please try again later.",
      );
    } else if (error.statusCode == 400) {
      globalSnackBar(
        title: "Error!",
        message: "Bad Request. Please try again later.",
      );
    } else {
      globalSnackBar(
        title: "Error!",
        message: "Failed to fetch products. Error: ${error.message}",
      );
    }
  } else if (error is SocketException) {
    globalSnackBar(title: "Error!", message: "No internet connection.");
  } else if (error is TimeoutException) {
    globalSnackBar(
      title: "Error!",
      message: "Request timed out. Please try again later.",
    );
  } else {
    Log.e("Error");
  }
}
