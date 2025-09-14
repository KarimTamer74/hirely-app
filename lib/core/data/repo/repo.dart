import 'package:dartz/dartz.dart';
import 'package:hirely/core/errors/failure.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';

abstract class Repo {
  Future<Either<Failure, List<JobModel>>> fetchJobs();
  Future<Either<Failure, JobModel>> insertJobs({required JobModel job});
}
