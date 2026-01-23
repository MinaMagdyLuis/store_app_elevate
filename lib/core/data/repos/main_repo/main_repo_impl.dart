import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app_elevate/core/data/model/failure.dart';
import 'package:store_app_elevate/core/data/model/product.dart';
import 'package:store_app_elevate/core/domain/repos/main_repo/main_online_ds.dart';
import 'package:store_app_elevate/core/domain/repos/main_repo/main_repo.dart';
import 'package:store_app_elevate/ui/utils/constants.dart';
import 'package:store_app_elevate/ui/utils/extensions.dart';
@Injectable(as: MainRepo)
class MainRepoImpl extends MainRepo {
  Connectivity connectivity;
  MainOnlineDS ds;
  MainRepoImpl(this.connectivity, this.ds);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    if (await connectivity.isInternetConnected) {
      return await ds.getProducts();
    } else {
      return Left(Failure(Constants.networkErrorMessage));
    }
  }
}
