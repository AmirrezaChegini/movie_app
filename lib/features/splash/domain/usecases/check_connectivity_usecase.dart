import 'dart:io';

import 'package:movie_app/core/utils/usecase.dart';

class CheckConnectivityUsecase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call(params) async {
    try {
      //for checking internet connection in splash page
      final List<InternetAddress> result =
          await InternetAddress.lookup('example.com');

      //this value must be true
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
