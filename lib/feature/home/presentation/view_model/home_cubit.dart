import 'package:bloc/bloc.dart';
import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entity.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entity.dart';
import 'package:cartzy_app/feature/home/domain/use_case/get_categories_use_case.dart';
import 'package:cartzy_app/feature/home/domain/use_case/get_product_use_case.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getCategoriesUseCase, this._getProductUseCase) : super(HomeInitial());
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductUseCase _getProductUseCase;
  List <CategoryEntity> listOfCategories = [];
  List <ProductEntity> listOfProduct = [];
  Future<void> getCategory() async {
    emit(GetCategoriesLoading());
    final result = await _getCategoriesUseCase.call();
    switch (result) {
      case NetworkSuccess<List<CategoryEntity>>():
        listOfCategories = result.data;
        emit(GetCategoriesSuccess());
      case NetworkError<List<CategoryEntity>>():
        emit(GetCategoriesError());
    }
  }

  Future<void> getProduct() async {
    emit(GetProductLoading());
    final result = await _getProductUseCase.call();
    switch (result) {
      case NetworkSuccess<List<ProductEntity>>():
        listOfProduct = result.data;
        emit(GetProductSuccess());
      case NetworkError<List<ProductEntity>>():
        emit(GetProductError());
    }
  }

}

 