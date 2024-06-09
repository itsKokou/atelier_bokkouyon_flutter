

import 'package:flutter_app/core/models/login_model.dart';
import 'package:flutter_app/core/models/login_response_model.dart';
import 'package:flutter_app/core/models/register_model.dart';
import 'package:flutter_app/core/repositories/security_repository.dart';

class SecurityService {
  static LoginResponseModel? connectedUser;
  static RegisterModel? registerModel;
  static SecurityRepository securityRepository = SecurityRepository();

  static Future<void> getConnectedUser(LoginModel loginModel) async {
    connectedUser = await securityRepository.findUserByLoginAndPassword(loginModel);
  }

  static Future<RegisterModel?> createPassager(RegisterModel registerModel) async {
    return await securityRepository.insertPassager(registerModel);
  }
}
