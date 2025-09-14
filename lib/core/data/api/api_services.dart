import 'package:dio/dio.dart';
import 'package:hirely/core/data/api/api_url.dart';
import 'package:hirely/core/data/models/job_model/job_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiUrl.baseApi)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET(ApiUrl.applications)
  Future<List<JobModel>> fetchJob();

  @POST(ApiUrl.applications)
  Future<JobModel> insertJob(@Body() JobModel job);
}
