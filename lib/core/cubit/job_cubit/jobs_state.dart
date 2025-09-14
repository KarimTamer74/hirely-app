part of 'jobs_cubit.dart';

class JobsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class JobInitial extends JobsState {}

class JobLoading extends JobsState {}

class GetRecentJobsLoading extends JobsState {}

class JobSuccess extends JobsState {
  final List<JobModel> job;

  JobSuccess(this.job);

  @override
  List<Object?> get props => [job];
}

class AddJobSuccess extends JobsState {
  final JobModel job;

  AddJobSuccess(this.job);

  @override
  List<Object?> get props => [job];
}

class GetRecentJobsSuccess extends JobsState {
  final List<JobModel> recentJobs;

  GetRecentJobsSuccess(this.recentJobs);

  @override
  List<Object?> get props => [recentJobs];
}

class JobFailure extends JobsState {
  final String message;

  JobFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AddJobFailure extends JobsState {
  final String message;

  AddJobFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class GetRecentJobsFailure extends JobsState {
  final String message;

  GetRecentJobsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
