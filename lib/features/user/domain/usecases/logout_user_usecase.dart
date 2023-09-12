import 'package:movie_app/core/utils/shared_pref.dart';
import 'package:movie_app/core/utils/usecase.dart';

class LogoutUserUsecase implements Usecase<void, dynamic> {
  @override
  Future<void> call(params) async {
    //clear token
    SharedPref.clearAll();
  }
}
