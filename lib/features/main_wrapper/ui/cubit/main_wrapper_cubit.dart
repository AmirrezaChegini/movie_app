import 'package:flutter_bloc/flutter_bloc.dart';

class MainWrapperCubit extends Cubit<int> {
  MainWrapperCubit() : super(1);

  //for changing bottomnavigationbar and pages
  void chnageIndex(int index) {
    emit(index);
  }
}
