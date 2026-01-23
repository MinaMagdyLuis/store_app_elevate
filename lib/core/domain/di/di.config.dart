// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:store_app_elevate/core/data/repos/main_repo/main_online_ds_impl.dart'
    as _i1066;
import 'package:store_app_elevate/core/data/repos/main_repo/main_repo_impl.dart'
    as _i982;
import 'package:store_app_elevate/core/domain/di/app_module.dart' as _i133;
import 'package:store_app_elevate/core/domain/repos/main_repo/main_online_ds.dart'
    as _i831;
import 'package:store_app_elevate/core/domain/repos/main_repo/main_repo.dart'
    as _i1039;
import 'package:store_app_elevate/core/domain/use_cases/get_all_products_usecase.dart'
    as _i505;
import 'package:store_app_elevate/ui/home_screen/home_screen_view_model.dart'
    as _i614;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i895.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i831.MainOnlineDS>(() => _i1066.MainOnlineDsImpl());
    gh.factory<_i1039.MainRepo>(
      () => _i982.MainRepoImpl(
        gh<_i895.Connectivity>(),
        gh<_i831.MainOnlineDS>(),
      ),
    );
    gh.factory<_i505.GetAllProductsUseCase>(
      () => _i505.GetAllProductsUseCase(gh<_i1039.MainRepo>()),
    );
    gh.factory<_i614.HomeViewModelCubit>(
      () => _i614.HomeViewModelCubit(gh<_i505.GetAllProductsUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i133.AppModule {}
