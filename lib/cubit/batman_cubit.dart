import 'package:flutter_bloc/flutter_bloc.dart';

class BatmanCubit extends Cubit<int> {
  BatmanCubit() : super(0);

  void incrementBatman() {
    emit(state + 1);
  }

  void decrementBatman() {
    emit(state - 1);
  }

  void zeroBatman() {
    emit(0);
  }
}
