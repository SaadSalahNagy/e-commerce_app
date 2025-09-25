import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/model/response/product_response_dto.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entity.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entity.dart';

abstract class HomeDataSourceContract {
  Future<NetworkResult<List<CategoryEntity>>> getCategory();
  Future<NetworkResult<List<ProductEntity>>> getProduct();
}
