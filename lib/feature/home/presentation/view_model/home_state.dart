part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class GetCategoriesLoading extends HomeState {}
class GetCategoriesSuccess extends HomeState {}
final class GetCategoriesError extends HomeState {}

class GetProductLoading extends HomeState {}
class GetProductSuccess extends HomeState {}
final class GetProductError extends HomeState {}