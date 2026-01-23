import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app_elevate/core/data/model/failure.dart';
import 'package:store_app_elevate/core/data/model/product.dart';
import 'package:store_app_elevate/core/domain/use_cases/get_all_products_usecase.dart';
import 'package:store_app_elevate/ui/utils/base_state.dart';

@injectable
class HomeViewModelCubit extends Cubit<BaseState> {
  HomeViewModelCubit(this.getAllProductsUseCase)
      : super(BaseInitialState());
  GetAllProductsUseCase getAllProductsUseCase;
  Future<void> loadProducts() async {
    emit(BaseLoadingState());
    final Either<Failure, List<Product>>result = await getAllProductsUseCase
        .execute();
    result.fold((failure) => emit(BaseErrorState(failure.errorMessage)),
          (products) =>emit(BaseSuccessState(data: products)),);
  }
}
