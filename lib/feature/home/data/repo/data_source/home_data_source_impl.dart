import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/api/home_api.dart';
import 'package:cartzy_app/feature/home/data/model/response/category_response_dto.dart';
import 'package:cartzy_app/feature/home/data/model/response/product_response_dto.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entity.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entity.dart';
import 'package:cartzy_app/feature/home/domain/repo/data_source/home_data_source_contract.dart';
class HomeDataSourceImpl implements HomeDataSourceContract {
  HomeDataSourceImpl(this._api);
  final HomeApi _api;

  @override
  Future<NetworkResult<List<CategoryEntity>>> getCategory() async {
    final result = await _api.getCategory();
    switch (result) {
      case NetworkSuccess<List<CategoryResponseDto>>():
        return NetworkSuccess<List<CategoryEntity>>(
            result.data.map((element) => element.toEntity()).toList());
      case NetworkError<List<CategoryResponseDto>>():
        return NetworkError(result.message);
    }
  }

  @override
  Future<NetworkResult<List<ProductEntity>>> getProduct() async{
    final result = await _api.getProduct();
    switch (result) {
      case NetworkSuccess<List<ProductResponseDto>>():
        return NetworkSuccess<List<ProductEntity>>(
          result.data.map((element) => element.toEntity()).toList(),
          );
      case NetworkError<List<ProductResponseDto>>():
        return NetworkError<List<ProductEntity>>(result.message);
    }
  }
}

HomeDataSourceContract injectableHomeDataSource() =>
    HomeDataSourceImpl(HomeApi.instance);
