part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterError extends RegisterState {}
class RegisterSuccess extends RegisterState {}