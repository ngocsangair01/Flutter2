// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _Api implements Api {
  _Api(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://apiminismart-production.up.railway.app/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GeneralService<Map<String, dynamic>>> login(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/auth/login/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/auth/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> register(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/auth/register/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> forgotPassword(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/auth/forget-password/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> changePassword(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/auth/change-password/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/categories',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getPost() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/posts',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getDetailPost(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/posts/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getAllProducts(
      {sort, page, limit, field, search}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sort': sort,
      r'page': page,
      r'limit': limit,
      r'field': field,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getProductDetail(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/products/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getAllDiaries() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/diaries',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getDiaryDetail(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/diaries/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getCart(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/cart',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> addToCart(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/cart/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> updateCart(id, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/cart/update-product/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> deleteCart(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/cart/delete-product/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> createAddress(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/address/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getAddress() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/address/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> deleteAddress(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/address/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> editAddress(id, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/address/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getAllOrders() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/orders/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> getOrderDetail(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/orders/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> createOrder(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/orders/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GeneralService<Map<String, dynamic>>> changeOrderStatus(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeneralService<Map<String, dynamic>>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/orders/change-status/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeneralService<Map<String, dynamic>>.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
