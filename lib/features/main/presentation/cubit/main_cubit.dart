import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  Future<void> doSomething() async {
    emit(MainLoading());
    try {
      // Call usecase
      // emit(MainSuccess(result));
    } catch (e) {
      emit(MainFailure(e.toString()));
    }
  }
}
