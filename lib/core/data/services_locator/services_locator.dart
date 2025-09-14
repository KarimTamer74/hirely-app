import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hirely/core/data/api/api_services.dart';
import 'package:hirely/core/network/dio_client.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/data/repo/repo_impl.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Dio
  sl.registerLazySingleton<Dio>(() => createDioClient());

  // ApiServices
  sl.registerLazySingleton<ApiServices>(() => ApiServices(sl<Dio>()));

  // Repo
  sl.registerLazySingleton<RepoImplementation>(
    () => RepoImplementation(sl<ApiServices>()),
  );

  // Jobs Cubit
  sl.registerLazySingleton<JobsCubit>(
    () => JobsCubit(sl<RepoImplementation>()),
  );
}
