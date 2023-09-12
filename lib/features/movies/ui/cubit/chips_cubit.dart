import 'package:flutter_bloc/flutter_bloc.dart';

class ChipsCubit extends Cubit<int> {
  ChipsCubit() : super(-1);

  int i = -1;

  //chnaging select choice chip
  void chnageIndex(int index) {
    i = index;
    emit(i);
  }
}
