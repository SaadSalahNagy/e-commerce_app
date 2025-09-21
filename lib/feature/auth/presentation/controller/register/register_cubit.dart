import 'package:bloc/bloc.dart';
import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/auth/data/model/request/registe_request_dto.dart';
import 'package:cartzy_app/feature/auth/data/model/response/register_response_dto.dart';
import 'package:cartzy_app/feature/auth/data/repo/repository/auth_repository_contract.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._repository) : super(RegisterInitial());
  final AuthRepositoryContract _repository;

  Future<void> register(String name, String email, String password) async {
    emit(RegisterLoading());
    final request = RegisterRequestDto(
      name: name,
      email: email,
      password: password,
    );
    final result = await _repository.register(request);
    switch(result){
      case NetworkSuccess<RegisterResponsetDto>():
        emit(RegisterSuccess());

      case NetworkError<RegisterResponsetDto>():
        emit(RegisterError());
    }
  }
}
