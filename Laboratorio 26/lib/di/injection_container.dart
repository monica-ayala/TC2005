import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:yolotl/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:yolotl/features/auth/data/repositories/user_repository_impl.dart';
import 'package:yolotl/features/auth/domain/repositories/user_repository.dart';
import 'package:yolotl/features/auth/domain/usecases/google_sign_in.dart';
import 'package:yolotl/features/auth/domain/usecases/google_sign_up.dart';
import 'package:yolotl/features/auth/domain/usecases/user_is_logged_in.dart';
import 'package:yolotl/features/auth/domain/usecases/user_login.dart';
import 'package:yolotl/features/auth/domain/usecases/user_register.dart';
import 'package:yolotl/features/home/data/datasources/bot_remote_data_source.dart';
import 'package:yolotl/features/home/data/repositories/bot_repository_impl.dart';
import 'package:yolotl/features/home/domain/repositories/bot_repository.dart';
import 'package:yolotl/features/home/domain/usecases/get_chat.dart';
import 'package:yolotl/features/home/domain/usecases/get_completion.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Chat Bot

  //! Usecases
  //* Users
  sl.registerLazySingleton(() => UserIsLoggedIn(sl()));
  sl.registerLazySingleton(() => UserLogin(sl()));
  sl.registerLazySingleton(() => UserRegister(sl()));
  sl.registerLazySingleton(() => GoogleSignIn(sl()));
  sl.registerLazySingleton(() => GoogleSignUp(sl()));

  //* Bot
  sl.registerLazySingleton(() => GetCompletion(sl()));
  sl.registerLazySingleton(() => GetChat(sl()));

  //! Repository
  //* Users
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));

  //* Bot

  sl.registerLazySingleton<BotRepository>(
      () => BotRepositoryImpl(remoteDataSource: sl()));

  //! DataSources
  //* Users
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  //* Bot

  sl.registerLazySingleton<BotRemoteDataSource>(
      () => BotRemoteDataSourceImpl(client: sl()));
  //! External
  sl.registerLazySingleton<http.Client>(() => http.Client());
}
