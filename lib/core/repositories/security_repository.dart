

import 'package:dio/dio.dart';
import 'package:flutter_app/core/constants/api.constante.dart';
import 'package:flutter_app/core/models/login_model.dart';
import 'package:flutter_app/core/models/login_response_model.dart';
import 'package:flutter_app/core/models/register_model.dart';

class SecurityRepository {
  static var url = "$apiUrl";
  static Dio dio = Dio();

  Future<LoginResponseModel?> findUserByLoginAndPassword(LoginModel loginModel) async {
    final response = await dio.post("$url/login",
        data: loginModel.toJson(),
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {Headers.contentTypeHeader: "application/json"}));

    if (response.statusCode == 200) {
      dynamic datas = response.data["results"];
      return LoginResponseModel.fromMap(datas);
    } else {
      return null;
    }
  }

  Future<RegisterModel?> insertPassager(
      RegisterModel registerModel) async {
    final response = await dio.post("$url/register-passager",
        data: registerModel.toJson(),
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {Headers.contentTypeHeader: "application/json"}));

    if (response.statusCode == 200) {
      dynamic datas = response.data["results"];
      return RegisterModel.fromMap(datas);
    } else {
      return null;
    }
  }
}
