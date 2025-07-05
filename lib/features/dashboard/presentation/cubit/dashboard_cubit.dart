import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  Future<void> doSomething() async {
    emit(DashboardLoading());
    try {
      // Call usecase
      // emit(DashboardSuccess(result));
    } catch (e) {
      emit(DashboardFailure(e.toString()));
    }
  }
}
