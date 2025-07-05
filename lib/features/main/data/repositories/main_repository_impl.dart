import '../../domain/repositories/main_repository.dart';
import '../datasources/main_remote_datasource.dart';

class MainRepositoryImpl implements MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);

  // TODO: Implement repository logic
}
