import 'package:dartz/dartz.dart';
import 'package:store_app_elevate/core/data/model/failure.dart';
import 'package:store_app_elevate/core/data/model/product.dart';

abstract class MainOnlineDS {
  Future<Either<Failure, List<Product>>> getProducts();
}
