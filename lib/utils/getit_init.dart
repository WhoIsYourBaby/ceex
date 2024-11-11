import 'package:ceex_flutter/repository/assets_repository.dart';
import 'package:ceex_flutter/repository/address_repository.dart';
import 'package:ceex_flutter/repository/basic_repository.dart';
import 'package:ceex_flutter/utils/dio_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:ceex_flutter/repository/repository.dart';

/// 所有的repository都需要在此注册
/// 在其他地方使用时
/// final repo = GetIt.I<UserRepository>();
Future<void> getItInit() async {
  // 注册dio
  final dio = DioManager.shared.dio;
  GetIt.I.registerLazySingleton<QuoteRepository>(
    () => QuoteRepository(dio),
  );
  GetIt.I.registerLazySingleton<UserRepository>(
    () => UserRepository(dio),
  );

  GetIt.I.registerLazySingleton<BasicRepository>(
    () => BasicRepository(dio),
  );
  GetIt.I.registerLazySingleton<PublishRepository>(
    () => PublishRepository(dio),
  );
  GetIt.I.registerLazySingleton<ContractRepository>(
    () => ContractRepository(dio),
  );
  GetIt.I.registerLazySingleton<AddressRepository>(
    () => AddressRepository(dio),
  );
  GetIt.I.registerLazySingleton<AssetsRepository>(
    () => AssetsRepository(dio),
  );
}
