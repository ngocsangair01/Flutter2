// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _Api implements Api {
  _Api(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.netfiin.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<GeneralService<Map<String, dynamic>>> login(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> register(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> confirmOTPLogin(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/login/confirm',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> confirmRegister(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/register/confirm',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> reSendOtp(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/login/resend-otp',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> forgotPassword(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/forgot-password',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> resetPassword(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/confirm-forgot-password',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> getHomeData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/home/list-package',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> getConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/home/config',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getLoanHistoryData(id, type, page) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'type': type,
      r'page': page
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/loan-history',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getLoanHistoryDetail(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/loan-history/detail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> insertDocument(documentEntity) async {
    ArgumentError.checkNotNull(documentEntity, 'documentEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = documentEntity;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/loan/insert',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> updateDocument(documentEntity) async {
    ArgumentError.checkNotNull(documentEntity, 'documentEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = documentEntity;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/loan/update',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getListNotification(page) async {
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/notification/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> getUserData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/getdata',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> updatePassword(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/change-pass',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> updateInfo(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/change-user',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> postFile(file) async {
    ArgumentError.checkNotNull(file, 'file');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'images[]',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/upload-image',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> postListFile(file) async {
    ArgumentError.checkNotNull(file, 'file');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(file.map((e) =>MapEntry('images[]',
        MultipartFile.fromFileSync(e.path,
            filename: e.path.split(Platform.pathSeparator).last))));
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/upload-image',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getInvesterData(status, page) async {
    ArgumentError.checkNotNull(status, 'status');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'status': status, r'page': page};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/assigned/loan',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getInvesterDetail(id, status) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(status, 'status');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'loan_package_id': id,
      r'status': status
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/assigned/loan/detail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> receivingDocument(documentEntity) async {
    ArgumentError.checkNotNull(documentEntity, 'documentEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = documentEntity;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/invester/receiving-loan-package',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> approvedDocument(documentEntity) async {
    ArgumentError.checkNotNull(documentEntity, 'documentEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = documentEntity;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/invester/approved-loan-package',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> cancelDocument(documentEntity) async {
    ArgumentError.checkNotNull(documentEntity, 'documentEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = documentEntity;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/invester/cancel-loan-package',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> addNote(documentEntity) async {
    ArgumentError.checkNotNull(documentEntity, 'documentEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = documentEntity;
    final _result = await _dio.request<Map<String, dynamic>>('api/v1/note',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getListNote(page, loanPackageId) async {
    ArgumentError.checkNotNull(page, 'page');
    ArgumentError.checkNotNull(loanPackageId, 'loanPackageId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'loan_package_id': loanPackageId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('api/v1/note',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getListInvester(
      page, loanPackageId) async {
    ArgumentError.checkNotNull(page, 'page');
    ArgumentError.checkNotNull(loanPackageId, 'loanPackageId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'id': loanPackageId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/loan-history/get-invester',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> assignInvester(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/loan-history/assign-invester',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> cancelAssignInvester(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/loan-history/cancel-assign-invester',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getYourLoanPackage(
      package_type, province, page) async {
    ArgumentError.checkNotNull(package_type, 'package_type');
    ArgumentError.checkNotNull(province, 'province');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'package_type': package_type,
      r'province': province,
      r'page': page
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/your-loan-package',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getAllLoanPackage(
      package_type, province, page) async {
    ArgumentError.checkNotNull(package_type, 'package_type');
    ArgumentError.checkNotNull(province, 'province');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'package_type': package_type,
      r'province': province,
      r'page': page
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/all-loan-packages',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralServiceList<dynamic>> getLoanPackageAssigned(
      package_type, province, page) async {
    ArgumentError.checkNotNull(package_type, 'package_type');
    ArgumentError.checkNotNull(province, 'province');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'package_type': package_type,
      r'province': province,
      r'page': page
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/loan-package-assigned',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralServiceList<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> registerReveicedLoanPackage(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/register-config-loan-package',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<InvesterInfoDetail>> getInvesterAssignDetail(
      investerId, loanId) async {
    ArgumentError.checkNotNull(investerId, 'investerId');
    ArgumentError.checkNotNull(loanId, 'loanId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': investerId,
      r'loan_id': loanId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/loan-history/get-invester-detail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<InvesterInfoDetail>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> getConfirmRegisterConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/confirm/register-config-loan-package',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> getRegisterLoanConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/get-config-loan-package',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> interestedLoan(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/interested-loan',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService<dynamic>> cancelLoan(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/your-loan-package/cancel',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralService> deleteAccount() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/v1/user/remove',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralService<dynamic>.fromJson(_result.data);
    return value;
  }
}
