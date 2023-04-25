import 'package:get_it/get_it.dart';
import 'package:mobile_shop_application/provider/auth_provider.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerLazySingleton<AuthProvider>(() => AuthProvider());
  getIt.registerLazySingleton<HomeProvider>(() => HomeProvider());
  getIt.registerLazySingleton<Loading>(() => Loading());
}
