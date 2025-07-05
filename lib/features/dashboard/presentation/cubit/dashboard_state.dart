abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  // final result;
  // Success(this.result);
}

class DashboardFailure extends DashboardState {
  final String error;
  DashboardFailure(this.error);
}
