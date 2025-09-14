import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hirely/core/errors/failure.dart';
import 'package:hirely/core/data/api/api_services.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';

import '../../errors/error_handler.dart';
import 'repo.dart';

class RepoImplementation implements Repo {
  ApiServices apiServices;
  RepoImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<JobModel>>> fetchJobs() async {
    try {
      var response = await apiServices.fetchJob();
      if (response.isEmpty) {
        return Left(Failure(
          message: "No jobs found",
          code: 404,
        ));
      }
      log("API Response: ${response.toString()}");
      return right(response);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      log("In Repo implementation Error: $e");
      log("Error: ${failure.message}");
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, JobModel>> insertJobs({required JobModel job}) async {
    try {
      log("Insert Payload: ${job.toJson()}");

      var response = await apiServices.insertJob(job);

      log("API Response: ${response.toString()}");
      return right(response);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      log("In Repo implementation Error: $e");
      log("Error: ${failure.message}");
      return left(failure);
    }
  }
}
