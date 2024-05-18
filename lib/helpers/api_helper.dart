import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:task1/modal/result_model.dart';


enum Method { post, get, put, patch, delete }

class APIHelper {
  static String hostUrl = "https://firebasestorage.googleapis.com/v0/b/jill-soap-6a1ac.appspot.com/o/maps.json?alt=media&token=bfd28b0f-06d7-4d25-8d45-e218466c7449";
  getResult() async{
    var data = await makeReq(hostUrl, null,method: Method.get);
    return ResultModel.fromJson(data);
  }

  makeReq(
    String apiUrl,
    dynamic body, {
    Method method = Method.post,
    String token = "",
  }) async {
    {

        final ioc = HttpClient();
        ioc.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        final https = IOClient(ioc);
        Uri url = Uri.parse(apiUrl);
        http.MultipartRequest request;
        Response response;
        var headers = {
          'Content-Type': 'application/json',
        };
        if (token.isNotEmpty) {
          headers['Authorization'] = "Bearer $token";
          headers['Accept'] = "application/json";
        }
        try {
          debugPrint(
              "API : ${method.toString()} url : $url \nrequest : ${body.toString()} ");
          switch (method) {
            case Method.post:
              if (body is Map<String, dynamic>) {
                try {
                  request = http.MultipartRequest('POST', url)
                    ..headers.addAll(headers);
                  body.forEach((key, value) async {
                    if (value != null) {
                      if (value is http.MultipartFile) {
                        try {
                          request.files.add(http.MultipartFile(
                            key,
                            value.finalize(),
                            value.length,
                            filename: value.filename,
                            contentType: value.contentType,
                          ));
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      } else {
                        request.fields[key] = value.toString();
                      }
                    }
                  });
                  final streamedResponse = await request.send();
                  response = await http.Response.fromStream(streamedResponse);

                } catch (e) {
                  debugPrint(e.toString());
                  throw Exception(e.toString());
                }
              } else {
                response = await https.post(
                  url,
                  headers: headers,
                  body: jsonEncode(body),
                  encoding: Encoding.getByName("utf-8"),
                );
              }
              break;
            case Method.get:
              if (body != null &&
                  body is Map &&
                  body.isNotEmpty &&
                  body is Map<String, dynamic>) {
                String queryString = Uri(queryParameters: body).query;
                url = Uri.parse("$apiUrl?$queryString");
              }
              response = await http.get(
                url
              );
              break;
            case Method.put:
              response = await https.put(url,
                  headers: headers,
                  body: jsonEncode(body),
                  encoding: Encoding.getByName("utf-8"));
              break;
            case Method.patch:
              response = await https.patch(url,
                  headers: headers,
                  body: jsonEncode(body),
                  encoding: Encoding.getByName("utf-8"));
              break;
            case Method.delete:
              response = await https.delete(url,
                  headers: headers,
                  body: jsonEncode(body),
                  encoding: Encoding.getByName("utf-8"));
              break;
            default:
              response = await https.post(url,
                  headers: headers,
                  body: jsonEncode(body),
                  encoding: Encoding.getByName("utf-8"));
          }
        } catch (e) {
          debugPrint(e.toString());
          if (e.toString().contains("Failed host lookup")) {
            throw ApiFailure(400, "Something went wrong");
          } else {
            throw ApiFailure(400, e.toString());
          }
        }
        if (response.statusCode != 404 &&
            response.statusCode != 500 &&
            response.statusCode != 401) {
          debugPrint("Response: ${jsonDecode(response.body).toString()}");
        } else if (response.statusCode == 401) {

        } else {
          debugPrint(
              "Response: ${response.statusCode.toString()} Something Went Wrong");
        }
              if (response.statusCode == 200 || response.statusCode == 201) {
          return jsonDecode(response.body);
        }
        else if (response.statusCode == 400) {
          var message = "";
          var body = jsonDecode(response.body) as LinkedHashMap?;
          if (body != null &&
              body["message"] is List &&
              body.containsKey("message")) {
            message = (body["message"] as List)[0];
          } else {
            message = (body?["message"]);
          }
          throw ApiFailure(response.statusCode, message);
        } else if (response.statusCode == 500) {
          throw ApiFailure(response.statusCode,
             "");
        } else if (response.statusCode == 401) {
        } else {
          throw ApiFailure(response.statusCode,
               "");
        }
      
      }
    }



}

class ApiFailure implements Exception {
  String message = "";
  int code = 400;

  ApiFailure(this.code, this.message);
}
