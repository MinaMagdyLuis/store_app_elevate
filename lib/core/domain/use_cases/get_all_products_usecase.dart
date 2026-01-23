import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:store_app_elevate/core/data/model/failure.dart';
import 'package:store_app_elevate/core/data/model/product.dart';
import 'package:store_app_elevate/core/domain/repos/main_repo/main_repo.dart';
import 'package:store_app_elevate/ui/utils/base_state.dart';

@injectable
class GetAllProductsUseCase  {
  MainRepo repo;
  GetAllProductsUseCase(this.repo) ;
  Future<Either<Failure,List<Product>>> execute() async {
   return repo.getProducts();
  }
}
