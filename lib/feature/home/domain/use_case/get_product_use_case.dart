import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/repo/repository/home_repository_impl.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entity.dart';
import 'package:cartzy_app/feature/home/domain/repo/repository/home_repository_contract.dart';

class GetProductUseCase {
  GetProductUseCase(this._repo);
  final HomeRepositoryContract _repo;

  Future<NetworkResult<List<ProductEntity>>> call() => _repo.getProduct();
}

GetProductUseCase injectableGetProductUseCase() =>
    GetProductUseCase(injectableHomeRepository());
