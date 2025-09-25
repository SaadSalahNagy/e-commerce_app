import 'package:cartzy_app/core/network/network.dart';
import 'package:cartzy_app/feature/home/data/repo/repository/home_repository_impl.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entity.dart';
import 'package:cartzy_app/feature/home/domain/repo/repository/home_repository_contract.dart';

class GetCategoriesUseCase {
  GetCategoriesUseCase(this._repo);
  final HomeRepositoryContract _repo;

  Future<NetworkResult<List<CategoryEntity>>> call() => _repo.getCategory();
}

GetCategoriesUseCase injectableGetCategoriesUseCase() =>
    GetCategoriesUseCase(injectableHomeRepository());