import 'dart:convert';
import 'package:get/get_connect.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({this.statusCode, this.bodyString});
}

enum METHODE {
  get,
  post,
  delete,
  update,
}

class ApiBaseHelper extends GetConnect {
  final String baseurl = "http://178.128.110.188/api/v1/";
  // final String baseurl = "${GlobalConfiguration().get("baseUrl")}";

  Future<dynamic> onNetworkRequesting(
      {required String url,
      Map<String, String>? header,
      Map<String, dynamic>? body,
      required METHODE? methode,
      required bool isAuthorize,
      bool isConvertToByte = false}) async {
    // final token = await LocalStorage.getLocalData('token');
    var token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUzNDUyNTMwLCJpYXQiOjE2NTI4NDc3MzAsImp0aSI6IjFkZTFjNTAyODYxNjRlYTJhNDIyNGVmNWMyMjc2OGYyIiwidXNlcl9pZCI6MTI2fQ._zoNzt2O4mZzFgRxwxflAIMYIsTfnb2GsQx6f6EbxxE';
    final fullUrl = baseurl + url;
    Map<String, String> _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': ""
      'Authorization': isAuthorize ? "Bearer $token" : ''
    };

    try {
      switch (methode) {
        case METHODE.get:
          final response = await get(fullUrl, headers: header ?? _header);
          return _returnResponse(response, isConvertToByte);
        case METHODE.post:
          if (body != null) {
            final response = await post(fullUrl, json.encode(body),
                headers: header ?? _header);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        case METHODE.delete:
          final response = await delete(fullUrl, headers: header ?? _header);
          return _returnResponse(response, isConvertToByte);
        case METHODE.update:
          if (body != null) {
            final response = await put(fullUrl, json.encode(body),
                headers: header ?? _header);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        default:
          break;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  dynamic _returnResponse(Response response, bool isReturnBytes) {
    switch (response.statusCode) {
      case 200:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 201:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 202:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 404:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 400:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 401:
      case 403:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 500:
        break;
      default:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString ?? '')));
    }
  }
}
