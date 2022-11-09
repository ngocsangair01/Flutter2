

import 'package:dio/dio.dart';
import 'package:minismart/api/general_service.dart';
import 'package:retrofit/http.dart';
import '../utils/contants.dart';
part 'api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class Api{
  factory Api(Dio dio) = _Api;

  // //auth
  // @POST("api/auth/login/")
  // Future<GeneralService<Map<String, dynamic>>> login(@Body() String body);
  //
  // @GET("api/auth/")
  // Future<GeneralService<Map<String, dynamic>>> getUser();
  //
  // @POST("api/auth/register/")
  // Future<GeneralService<Map<String, dynamic>>> register(@Body() String body);
  //
  // @POST("api/auth/forget-password/")
  // Future<GeneralService<Map<String, dynamic>>> forgotPassword(@Body() String body);
  //
  // @PUT("api/auth/change-password/")
  // Future<GeneralService<Map<String, dynamic>>> changePassword(@Body() String body);
  //
  // @GET("api/categories")
  // Future<GeneralService<Map<String, dynamic>>> getCategories();
  //
  // @GET("api/posts")
  // Future<GeneralService<Map<String, dynamic>>> getPost();
  //
  // @GET("api/posts/{id}")
  // Future<GeneralService<Map<String, dynamic>>> getDetailPost(@Path("id") String id);
  //
  // @GET("api/products")
  // Future<GeneralService<Map<String, dynamic>>> getAllProducts(
  //     {@Query("sort") String? sort,
  //     @Query("page") int? page,
  //     @Query("limit") int? limit,
  //     @Query("field") String? field,
  //     @Query("search") String? search});
  //
  // @GET("api/products/{id}")
  // Future<GeneralService<Map<String, dynamic>>> getProductDetail(@Path("id") String id);
  //
  // @GET("api/diaries")
  // Future<GeneralService<Map<String, dynamic>>> getAllDiaries();
  //
  // @GET("api/diaries/{id}")
  // Future<GeneralService<Map<String, dynamic>>> getDiaryDetail(@Path("id") String id);
  //
  // @GET("api/cart")
  // Future<GeneralService<Map<String, dynamic>>> getCart(@Body() String body);
  //
  // @PUT("api/cart/add")
  // Future<GeneralService<Map<String, dynamic>>> addToCart(@Body() String body);
  //
  // @PUT("api/cart/update-product/{id}")
  // Future<GeneralService<Map<String, dynamic>>> updateCart(@Path("id") String id, @Body() String body);
  //
  // @PUT("api/cart/delete-product/{id}")
  // Future<GeneralService<Map<String, dynamic>>> deleteCart(@Path("id") String id);
  //
  // @POST("api/address/")
  // Future<GeneralService<Map<String, dynamic>>> createAddress(@Body() String body);
  //
  // @GET("api/address/")
  // Future<GeneralService<Map<String, dynamic>>> getAddress();
  //
  // @DELETE("api/address/{id}")
  // Future<GeneralService<Map<String, dynamic>>> deleteAddress(@Path("id") String id);
  //
  // @PUT("api/address/{id}")
  // Future<GeneralService<Map<String, dynamic>>> editAddress(@Path("id") String id,@Body() String body);
  //
  // @GET("api/orders/")
  // Future<GeneralService<Map<String, dynamic>>> getAllOrders();
  //
  // @GET("api/orders/{id}")
  // Future<GeneralService<Map<String, dynamic>>> getOrderDetail(@Path("id") String id);
  //
  // @POST("api/orders/")
  // Future<GeneralService<Map<String, dynamic>>> createOrder(@Body() String body);
  //
  // @PUT("api/orders/change-status/{id}")
  // Future<GeneralService<Map<String, dynamic>>> changeOrderStatus(@Path("id") String id);
  @POST("/subjects/{idCategory}")
  Future<GeneralService<Map<String,dynamic>>> createSubject(
      @Path("idCategory")int idCategory,
      @Body()String body);

  @GET("/subjects/getAll")
  Future<GeneralService<Map<String,dynamic>>> viewAllSubject();

  @GET("/subjects/getAll/{idCategory}")
  Future<GeneralService<Map<String,dynamic>>> viewAllSubjectByCategory(@Path("idCategory")int idCategory);

  @PATCH("/subjects/{idSubject}")
  Future<GeneralService<Map<String,dynamic>>> editSubject(@Path("idSubject")int idSubject, @Body()String body);

  @DELETE("/subjects/{idSubject}")
  Future<GeneralService<Map<String,dynamic>>> deleteSubject(@Path("idSubject")int idSubject);

  @POST("/categories")
  Future<GeneralService<Map<String,dynamic>>> createCategory(@Body()String bodyCategory);

  @GET("/categories")
  Future<GeneralService<Map<String,dynamic>>> viewAllCategory();

  @PATCH("/categories/{idCategory}")
  Future<GeneralService<Map<String,dynamic>>> editCategory(@Path("idCategory")int idCategory,@Body()String bodyCategory);

  @DELETE("/categories/{idCategory}")
  Future<GeneralService<Map<String,dynamic>>> deleteCategory(@Path("idCategory")int idCategory);

  @GET("/categories/{idCategory}")
  Future<GeneralService<Map<String,dynamic>>> getCategory(@Path("idCategory")int idCategory);
}