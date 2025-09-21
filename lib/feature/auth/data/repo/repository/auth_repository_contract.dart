import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/auth/data/model/request/login_request_dto.dart';
import 'package:cartzy_app/feature/auth/data/model/request/registe_request_dto.dart';
import 'package:cartzy_app/feature/auth/data/model/response/login_response_dto.dart';
import 'package:cartzy_app/feature/auth/data/model/response/register_response_dto.dart';

abstract class AuthRepositoryContract {
  Future<NetworkResult<RegisterResponsetDto>> register(
      RegisterRequestDto request);
  Future<NetworkResult<LoginResponseDto>> login(
      LoginRequestDto request);
}