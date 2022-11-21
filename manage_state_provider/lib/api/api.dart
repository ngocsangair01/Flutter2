//
//
// import 'package:dio/dio.dart';
// import './general_service.dart';
// import 'package:retrofit/http.dart';
// import '../utils/contants.dart';
// part 'api.g.dart';
//
// @RestApi(baseUrl: baseUrl)
// abstract class Api{
//   factory Api(Dio dio) = _Api;
//
//   @POST("/subjects/{idCategory}")
//   Future<GeneralService<Map<String,dynamic>>> createSubject(
//       @Path("idCategory")int idCategory,
//       @Body()String body);
//
//   @GET("/subjects/getAll")
//   Future<GeneralService<Map<String,dynamic>>> viewAllSubject();
//
//   @GET("/subjects/getAll/{idCategory}")
//   Future<GeneralService<Map<String,dynamic>>> viewAllSubjectByCategory(@Path("idCategory")int idCategory);
//
//   @PATCH("/subjects/{idSubject}")
//   Future<GeneralService<Map<String,dynamic>>> editSubject(@Path("idSubject")int idSubject, @Body()String body);
//
//   @DELETE("/subjects/{idSubject}")
//   Future<GeneralService<Map<String,dynamic>>> deleteSubject(@Path("idSubject")int idSubject);
//
//   @POST("/categories")
//   Future<GeneralService<Map<String,dynamic>>> createCategory(@Body()String bodyCategory);
//
//   @GET("/categories")
//   Future<GeneralService<Map<String,dynamic>>> viewAllCategory();
//
//   @PATCH("/categories/{idCategory}")
//   Future<GeneralService<Map<String,dynamic>>> editCategory(@Path("idCategory")int idCategory,@Body()String bodyCategory);
//
//   @DELETE("/categories/{idCategory}")
//   Future<GeneralService<Map<String,dynamic>>> deleteCategory(@Path("idCategory")int idCategory);
//
//   @GET("/categories/{idCategory}")
//   Future<GeneralService<Map<String,dynamic>>> getCategory(@Path("idCategory")int idCategory);
// }