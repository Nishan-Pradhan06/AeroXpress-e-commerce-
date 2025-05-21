import 'package:get_it/get_it.dart';
import '../services/once_cache_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerSingleton(() => OnceCacheService());
}
