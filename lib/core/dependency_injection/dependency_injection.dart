import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api/app_interceptor.dart';
import '../api/dio_consumer.dart';
import '../api/end_points.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //!================= SCROLL NOTIFIER =================
  // getIt.registerSingleton<ScrollNotifier>(ScrollNotifier());
  //! DIO CONFIGURATIONS
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: const Duration(seconds: 90),
          receiveTimeout: const Duration(seconds: 90),
        )
        ..followRedirects = false
        ..receiveDataWhenStatusError = true,
    ),
  );

  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: getIt.get<Dio>()
        ..interceptors.add(AppInterceptors(dio: getIt.get<Dio>()))
        ..interceptors.addAll([
          if (kDebugMode)
            PrettyDioLogger(
              request: true,
              requestBody: true,
              responseHeader: true,
              responseBody: true,
              error: true,
              compact: true,
            ),
        ]),
    ),
  );
  getIt.registerSingleton<CancelToken>(CancelToken());

  // LOGIN
  // getIt.registerLazySingleton<LoginRepo>(
  //   () => LoginRepoImpl(apiConsumer: getIt.get<DioConsumer>()),
  // );
  // // //! SIGN UP
  // getIt.registerLazySingleton<SignUpRepo>(
  //   () => SignUpRepoImpl(apiConsumer: getIt.get<DioConsumer>()),
  // );
  // getIt.registerLazySingleton<StoreSignUpRepo>(
  //   () => SignUpStoreRepoImpl(
  //     remoteDataSource: getIt.get<BaseSignUpStoreRemoteDataSource>(),
  //   ),
  // );
  // getIt.registerLazySingleton<BaseSignUpStoreRemoteDataSource>(
  //   () => SignUpStoreRemoteDataSource(getIt.get<DioConsumer>()),
  // );
  // // // //! FORGET PASSWORD
  // getIt.registerLazySingleton<ForgetPassRepo>(
  //   () => ForgetPassRepoImpl(apiConsumer: getIt.get<DioConsumer>()),
  // );

  // getIt.registerLazySingleton(() => SendEmailToGetOtpUseCase(
  //       signUpRepo: getIt.get<SignUpRepo>(),
  //     ));

  // getIt.registerLazySingleton(() => CheckOtpCodeUseCase(
  //       signUpRepo: getIt.get<SignUpRepo>(),
  //     ));

  //!=============== CUSTOMER ======================!//

  //#============== Layout  ========================#//
  // Repositories
  // getIt.registerLazySingleton<LayoutRepo>(
  //   () => LayoutRepoImpl(apiConsumer: getIt.get<DioConsumer>()),
  // );
  // // // // use cases
  // getIt.registerLazySingleton(
  //   () => CheckNonSeenNotificationUseCase(layoutRepo: getIt.get<LayoutRepo>()),
  // );
  // getIt.registerLazySingleton(
  //   () => GetLocalProductsUseCase(layoutRepo: getIt.get<LayoutRepo>()),
  // );
  // getIt.registerLazySingleton(
  //   () => UpdateLocalUseCase(layoutRepo: getIt.get<LayoutRepo>()),
  // );
  // getIt.registerLazySingleton(
  //   () => UpdatePetLocalUseCase(layoutRepo: getIt.get<LayoutRepo>()),
  // );
  // getIt.registerLazySingleton(
  //   () => UpdateLocalStoreUseCase(layoutRepo: getIt.get<LayoutRepo>()),
  // );
  // // getIt.registerLazySingleton(
  // //   () => CheckCartUseCase(checkOutRepo: getIt.get<CheckOutRepo>()),
  // // );
  // getIt.registerLazySingleton(
  //   () => ToggleFaveUseCase(layoutRepo: getIt.get<LayoutRepo>()),
  // );
  // getIt.registerLazySingleton(
  //   () => GetAllFavItems(layoutRepo: getIt.get<LayoutRepo>()),
  // );

  //#============== Home  ==========================#//
  //  Repositories
  // getIt.registerLazySingleton<CustomerHomeRepo>(
  //   () => CustomerHomeRepoImpl(apiConsumer: getIt.get<DioConsumer>()),
  // );
  // getIt.registerLazySingleton<CustomerGetProductsUseCase>(
  //   () => CustomerGetProductsUseCase(
  //     customerHomeRepo: getIt.get<CustomerHomeRepo>(),
  //   ),
  // );
  // getIt.registerLazySingleton<CustomerSingleStoreUseCase>(
  //   () => CustomerSingleStoreUseCase(
  //     customerHomeRepo: getIt.get<CustomerHomeRepo>(),
  //   ),
  // );

  // getIt.registerLazySingleton<GetSlidersUseCase>(
  //   () => GetSlidersUseCase(customerHomeRepo: getIt.get<CustomerHomeRepo>()),
  // );
  // getIt.registerLazySingleton<CustomerGetPetsUseCase>(
  //   () =>
  //       CustomerGetPetsUseCase(customerHomeRepo: getIt.get<CustomerHomeRepo>()),
  // );
  // //========================My animals============================

  // getIt.registerLazySingleton<MyAnimalsRepo>(
  //   () => MyAnimalRepoImpl(apiConsumer: getIt.get<DioConsumer>()),
  // );
  // //Use cases

  // getIt.registerLazySingleton<CreateNewAnimalToMineUseCase>(
  //   () =>
  //       CreateNewAnimalToMineUseCase(myAnimalsRepo: getIt.get<MyAnimalsRepo>()),
  // );
  // getIt.registerLazySingleton<UpdateMyAnimalUseCase>(
  //   () => UpdateMyAnimalUseCase(myAnimalsRepo: getIt.get<MyAnimalsRepo>()),
  // );
  // getIt.registerLazySingleton<DeleteMyAnimalUseCase>(
  //   () => DeleteMyAnimalUseCase(myAnimalsRepo: getIt.get<MyAnimalsRepo>()),
  // );
  // getIt.registerLazySingleton<GetMyAnimalsUseCase>(
  //   () => GetMyAnimalsUseCase(myAnimalsRepo: getIt.get<MyAnimalsRepo>()),
  // );
  // getIt.registerLazySingleton<CustomerUploadImageUseCase>(
  //   () => CustomerUploadImageUseCase(getIt.get<MyAnimalsRepo>()),
  // );
  // //========================My animals============================
  // getIt.registerLazySingleton<CustomerStoreRepo>(
  //   () => CustomerStoreRepoImpl(apiConsumer: getIt.get<DioConsumer>()),
  // );
  // getIt.registerFactory<MyAnimalCubit>(
  //   () => MyAnimalCubit(
  //     getMyAnimalsUseCase: getIt.get<GetMyAnimalsUseCase>(),
  //     createNewAnimalToMineUseCase: getIt.get<CreateNewAnimalToMineUseCase>(),
  //     updateMyAnimalUseCase: getIt.get<UpdateMyAnimalUseCase>(),
  //     deleteMyAnimalUseCase: getIt.get<DeleteMyAnimalUseCase>(),
  //     uploadImageUseCase: getIt.get<CustomerUploadImageUseCase>(),
  //   ),
  // );
  // getIt.registerFactory<AnimalForSellCubit>(
  //   () => AnimalForSellCubit(
  //     getMyAnimalsUseCase: getIt.get<GetMyAnimalsUseCase>(),
  //     createNewAnimalToMineUseCase: getIt.get<CreateNewAnimalToMineUseCase>(),
  //     updateMyAnimalUseCase: getIt.get<UpdateMyAnimalUseCase>(),
  //     deleteMyAnimalUseCase: getIt.get<DeleteMyAnimalUseCase>(),
  //     uploadImageUseCase: getIt.get<CustomerUploadImageUseCase>(),
  //   ),
  // );
}
