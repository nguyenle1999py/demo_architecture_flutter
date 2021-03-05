import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:demo_architecture/feature/data/datasources/localsources/user_inform_local_sources.dart';
import 'package:demo_architecture/feature/data/datasources/remotesources/user_inform_remote_data.dart';
import 'package:demo_architecture/feature/data/repositories/user_inform.repository_impl.dart';
import 'package:demo_architecture/feature/domain/repositories/user/user_inform_repository.dart';
import 'package:demo_architecture/feature/domain/usecase/user/get_user_inform.dart';
import 'package:demo_architecture/feature/presentation/bloc/userinform/user_inform_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/platform/network_infor.dart';
import 'core/utils/input_string_int.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
        () => UserInformBloc(
      get: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUserInform(sl()));

  // Repository
  sl.registerLazySingleton<UserInformRepository>(
        () => UserInformRepoImpl(
            userInformLocalData: sl(),
            userInformRemoteData: sl(),
            networkInfo: sl()
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserInformRemoteData>(
        () => UserInformRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<UserInformLocalData>(
        () => UserInformLocalDataImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}