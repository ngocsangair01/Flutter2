
import 'dart:core';
import 'dart:io';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:thegioivaymobile/models/response/config/question_data.dart';
import 'package:thegioivaymobile/models/response/document/detail/DocumentEntity.dart';
import 'package:thegioivaymobile/models/response/invester/InvesterInfoDetail.dart';
import 'package:thegioivaymobile/res/strings.dart';
import 'package:thegioivaymobile/services/http/GeneralServiceList.dart';

import 'GeneralService.dart';

part 'Api.g.dart';
@RestApi(baseUrl: baseUrl)
abstract class Api {
  factory Api(Dio dio) = _Api;

  @POST("api/v1/user/login")
  Future<GeneralService<Map<String, dynamic>>> login(@Body() String body);

  @POST("api/v1/user/register")
  Future<GeneralService<Map<String, dynamic>>> register(@Body() String body);

  @POST("api/v1/user/login/confirm")
  Future<GeneralService<Map<String, dynamic>>> confirmOTPLogin(@Body() String body);

  @POST("api/v1/user/register/confirm")
  Future<GeneralService<Map<String, dynamic>>> confirmRegister(@Body() String body);


  @POST("api/v1/user/login/resend-otp")
  Future<GeneralService<Map<String, dynamic>>> reSendOtp(@Body() String body);

  @POST("api/v1/forgot-password")
  Future<GeneralService<Map<String, dynamic>>> forgotPassword(@Body() String body);

  @POST("api/v1/confirm-forgot-password")
  Future<GeneralService<Map<String, dynamic>>> resetPassword(@Body() String body);

  @GET("api/v1/home/list-package")
  Future<GeneralService> getHomeData();

  @GET("api/v1/home/config")
  Future<GeneralService> getConfig();

  @GET("api/v1/user/loan-history")
  Future<GeneralServiceList> getLoanHistoryData(@Query("id") int id, @Query("type") String type, @Query("page") int page);

  @GET("api/v1/user/loan-history/detail")
  Future<GeneralServiceList> getLoanHistoryDetail(@Query("id") String id);

  @POST("api/v1/user/loan/insert")
  Future<GeneralService> insertDocument(@Body() String documentEntity);

  @POST("api/v1/user/loan/update")
  Future<GeneralService> updateDocument(@Body() String documentEntity);

  @GET("api/v1/notification/list")
  Future<GeneralServiceList> getListNotification( @Query("page") int page);

  @GET("api/v1/user/getdata")
  Future<GeneralService> getUserData();

  @POST("api/v1/user/change-pass")
  Future<GeneralService> updatePassword(@Body() String body);

  @POST("api/v1/user/change-user")
  Future<GeneralService> updateInfo(@Body() String body);

  @POST("api/v1/upload-image")
  Future<GeneralService> postFile(@Part(name: "images[]") File file );
  @POST("api/v1/upload-image")
  Future<GeneralService> postListFile(@Part(name: "images[]") List<File> file );

  @GET("api/v1/assigned/loan")
  Future<GeneralServiceList> getInvesterData( @Query("status") String status, @Query("page") int page);

  @GET("api/v1/assigned/loan/detail")
  Future<GeneralServiceList> getInvesterDetail(@Query("loan_package_id") String id,
      @Query("status") String status);

  @POST("api/v1/invester/receiving-loan-package")
  Future<GeneralService> receivingDocument(@Body() String documentEntity);

  @POST("api/v1/invester/approved-loan-package")
  Future<GeneralService> approvedDocument(@Body() String documentEntity);

  @POST("api/v1/invester/cancel-loan-package")
  Future<GeneralService> cancelDocument(@Body() String documentEntity);

  @POST("api/v1/note")
  Future<GeneralService> addNote(@Body() String documentEntity);

  @GET("api/v1/note")
  Future<GeneralServiceList> getListNote( @Query("page") int page, @Query("loan_package_id") int loanPackageId);

  @GET("api/v1/loan-history/get-invester")
  Future<GeneralServiceList> getListInvester( @Query("page") int page, @Query("id") int loanPackageId);

  @POST("api/v1/loan-history/assign-invester")
  Future<GeneralService> assignInvester(@Body() String body);

  @POST("api/v1/loan-history/cancel-assign-invester")
  Future<GeneralService> cancelAssignInvester(@Body() String body);

  @GET("api/v1/your-loan-package")
  Future<GeneralServiceList> getYourLoanPackage( @Query("package_type") String package_type,
      @Query("province") String province ,@Query("page") int page);

  @GET("api/v1/all-loan-packages")
  Future<GeneralServiceList> getAllLoanPackage(  @Query("package_type") String package_type,
      @Query("province") String province ,@Query("page") int page);

  @GET("api/v1/loan-package-assigned")
  Future<GeneralServiceList> getLoanPackageAssigned( @Query("package_type") String package_type,
      @Query("province") String province ,@Query("page") int page);

  @POST("api/v1/user/register-config-loan-package")
  Future<GeneralService> registerReveicedLoanPackage(@Body() String body);

  @GET("api/v1/loan-history/get-invester-detail")
  Future<GeneralService<InvesterInfoDetail>> getInvesterAssignDetail( @Query("id") String investerId,
      @Query("loan_id") String loanId );

  @GET("api/v1/user/confirm/register-config-loan-package")
  Future<GeneralService> getConfirmRegisterConfig();

  @GET("api/v1/user/get-config-loan-package")
  Future<GeneralService> getRegisterLoanConfig();

  @POST("api/v1/user/interested-loan")
  Future<GeneralService> interestedLoan(@Body() String body);

  @POST("api/v1/your-loan-package/cancel")
  Future<GeneralService> cancelLoan(@Body() String body);

  @POST("api/v1/user/remove")
  Future<GeneralService> deleteAccount();


}