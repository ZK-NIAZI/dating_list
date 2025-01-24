import 'package:dating_list/module/dating_list/repository/dating_repository.dart';
import 'package:get_it/get_it.dart';

import '../../config/environment.dart';
import '../network/dio_client.dart';
final sl = GetIt.instance;

void setupLocator(Environment environment) async {
  /// ==================== Environment =========================
  sl.registerLazySingleton<Environment>(() => environment);


  /// ==================== Networking ===========================
  sl.registerLazySingleton<DioClient>(() => DioClient(environment: sl()));

  sl.registerLazySingleton<DatingRepository>(
    () => DatingRepository(dioClient: sl<DioClient>()),
  );
}
