

import 'package:dio/dio.dart';
import './general_service.dart';
import 'package:retrofit/http.dart';
import '../utils/contants.dart';
part 'api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class Api{
  factory Api(Dio dio) = _Api;


  @POST("/auth/login")
  Future<GeneralService<Map<String,dynamic>>> login(@Body()String body);

  @GET("subjects/time-table")
  Future<GeneralService2<Map<String,dynamic>>> getTimeTables();

  @GET("/subjects")
  Future<GeneralService<Map<String,dynamic>>> getSubjects();

  @GET("/subjects/time-table-detail/{idSubject}")
  Future<GeneralService2<Map<String,dynamic>>> getTimeTableDetail(@Path("idSubject")int id);

  @GET("/subjects/students/{idSubject}")
  Future<GeneralService<Map<String,dynamic>>> getAllStudentByIdSubject(@Path("idSubject")int id);

  @GET("/subjects/students/{idSubject}/{studentCode}")
  Future<GeneralService2<Map<String,dynamic>>> getStudentDetail(@Path("idSubject") int idSubject,@Path("studentCode")String studentCode);

}