import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';
import 'package:hirely/core/data/repo/repo.dart';
import 'package:hirely/core/helper/enums.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  final Repo repo;

  JobsCubit(this.repo) : super(JobInitial());

  // Temporary storage for first page data
  String? title;
  String? company;
  String? location;
  JobMode? jobMode;
  JobType? jobType;
  String? postLink;
  List<JobModel> allJobs = [];
  List<JobModel> recentJobs = [];
  Future<void> fetchJobs() async {
    emit(JobLoading());

    final result = await repo.fetchJobs();

    result.fold(
      (failure) {
        log(failure.message, name: 'JobsCubit Fetch Error');
        emit(JobFailure(failure.message));
      },
      (jobs) {
        allJobs = jobs;
        log("Fetched Jobs: ${jobs.length}", name: 'JobsCubit Success');
        emit(JobSuccess(jobs));
      },
    );
  }

  Future<void> getRecentJobs() async {
    emit(GetRecentJobsLoading());
    try {
      await fetchJobs();
      final sortedJobs = List<JobModel>.from(allJobs)
        ..sort(
            (a, b) => (b.date ?? DateTime(0)).compareTo(a.date ?? DateTime(0)));
      log("Sorted Jobs: ${sortedJobs.length}", name: 'JobsCubit Success');
      recentJobs = sortedJobs.take(5).toList();
      log("Recent Jobs: ${recentJobs.length}", name: 'JobsCubit Success');
      log("Recent Jobs: $recentJobs", name: 'JobsCubit Success');
      emit(GetRecentJobsSuccess(recentJobs));
    } on Exception catch (e) {
      log(e.toString(), name: 'JobsCubit Error');
      emit(GetRecentJobsFailure(e.toString()));
    }
  }

  void saveFirstPageData({
    required String title,
    required String company,
    String? location,
    required JobMode jobMode,
    required JobType jobType,
    String? postLink,
  }) {
    this.title = title;
    this.company = company;
    this.location = location;
    this.jobMode = jobMode;
    this.jobType = jobType;
    this.postLink = postLink;
  }

  /// Insert final job
  Future<void> insertJob({
    required DateTime? date,
    String? notes,
    String? tags,
    String? cvUrl,
  }) async {
    emit(AddJobLoading());

    final job = JobModel(
      title: title ?? 'Flutter',
      company: company ?? 'company',
      location: location ?? 'Tanta',
      jobMode: jobMode ?? JobMode.hybrid,
      jobType: jobType ?? JobType.fullTime,
      postLink: postLink ?? 'postLink',
      date: DateTime.now(),
      notes: "NOOOOOOOOOOOOOO",
      tags: "tags",
      cvUrl: "cvUrl",
    );

    final result = await repo.insertJobs(job: job);

    result.fold(
      (failure) {
        log(failure.message, name: 'JobsCubit Insert Error');
        emit(AddJobFailure(failure.message));
      },
      (insertedJob) {
        log("Job inserted successfully", name: 'JobsCubit Insert Success');
        emit(AddJobSuccess(insertedJob));
      },
    );
  }
}
