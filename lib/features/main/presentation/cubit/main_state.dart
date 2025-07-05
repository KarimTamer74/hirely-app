abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainSuccess extends MainState {
  // final result;
  // Success(this.result);
}

class MainFailure extends MainState {
  final String error;
  MainFailure(this.error);
}
