import 'package:bloc/bloc.dart';

//for managing visibility of textfield password
class PassVisibleCubit extends Cubit<bool> {
  PassVisibleCubit() : super(true);

  void chnageVisibility(bool isVisible) {
    emit(isVisible);
  }
}
