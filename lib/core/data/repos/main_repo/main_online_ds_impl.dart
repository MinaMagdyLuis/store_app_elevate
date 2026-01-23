import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app_elevate/core/data/model/failure.dart';
import 'package:store_app_elevate/core/data/model/product.dart';
import 'package:store_app_elevate/core/data/utils/end_points.dart';
import 'package:store_app_elevate/core/domain/repos/main_repo/main_online_ds.dart';
@Injectable(as:MainOnlineDS)
class MainOnlineDsImpl extends MainOnlineDS {
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.products);
      Response response = await get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final List decodedResponse = jsonDecode(response.body);
        final List<Product> products = decodedResponse.map((product) =>
            Product.fromJson(product)).toList();
        return Right(products);
      }
      return Left(Failure("Invalid products response format"));
    }
    catch (error, stack) {
      print("getProducts error: $error\n$stack");
      return Left(Failure("Failed to load products"));
    }
  }
}