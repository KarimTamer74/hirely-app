import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/data/api/api_services.dart';
import 'package:hirely/core/data/api/api_url.dart';
import 'package:hirely/core/data/repo/repo_impl.dart';
import 'package:hirely/core/network/dio_client.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Dio Client
  sl.registerLazySingleton<Dio>(() => createDioClient());

  sl.registerLazySingleton<ApiServices>(
    () => ApiServices(sl<Dio>(), baseUrl: ApiUrl.baseApi),
  );

  // Repository
  sl.registerLazySingleton<RepoImplementation>(
    () => RepoImplementation(sl<ApiServices>()),
  );

  // Jobs Cubit
  sl.registerFactory<JobsCubit>(
    () => JobsCubit(sl<RepoImplementation>()),
  );
}
