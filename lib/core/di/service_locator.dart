import 'package:bookia/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:bookia/features/auth/data/repo/auth_repo_impl.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:bookia/features/auth/domain/usecases/check_forget_password_usecase.dart';
import 'package:bookia/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:bookia/features/auth/domain/usecases/login_usecase.dart';
import 'package:bookia/features/auth/domain/usecases/register_usecase.dart';
import 'package:bookia/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/book_details/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:bookia/features/book_details/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:bookia/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:bookia/features/cart/data/data_source/cart_remote_data_source_impl.dart';
import 'package:bookia/features/cart/data/repo/cart_repo_impl.dart';
import 'package:bookia/features/cart/domain/repository/cart_repo.dart';
import 'package:bookia/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/checkout_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:bookia/features/home/data/repo/home_repo_impl.dart';
import 'package:bookia/features/home/domain/repository/home_repo.dart';
import 'package:bookia/features/home/domain/usecases/get_best_seller_usecase.dart';
import 'package:bookia/features/home/domain/usecases/get_slider_usecase.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:bookia/features/wishlist/data/data_source/wishlist_remote_data_source_impl.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo_impl.dart';
import 'package:bookia/features/wishlist/domain/repository/wishlist_repo.dart';
import 'package:bookia/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:bookia/features/profile/data/data_source/profile_remote_data_source_impl.dart';
import 'package:bookia/features/profile/data/repo/profile_repo_impl.dart';
import 'package:bookia/features/profile/domain/repository/profile_repo.dart';
import 'package:bookia/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/get_orders_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/features/profile/presentation/pages/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:bookia/features/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/features/place_order/data/data_source/place_order_remote_data_source_impl.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo_impl.dart';
import 'package:bookia/features/place_order/domain/repository/place_order_repo.dart';
import 'package:bookia/features/place_order/domain/usecases/get_governorates_usecase.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:bookia/features/contact_us/data/data_source/contact_us_remote_data_source.dart';
import 'package:bookia/features/contact_us/data/data_source/contact_us_remote_data_source_impl.dart';
import 'package:bookia/features/contact_us/data/repo/contact_us_repo_impl.dart';
import 'package:bookia/features/contact_us/domain/repository/contact_us_repo.dart';
import 'package:bookia/features/contact_us/domain/usecases/send_message_usecase.dart';
import 'package:bookia/features/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'package:bookia/features/faq/data/data_source/faq_remote_data_source.dart';
import 'package:bookia/features/faq/data/data_source/faq_remote_data_source_impl.dart';
import 'package:bookia/features/faq/data/repo/faq_repo_impl.dart';
import 'package:bookia/features/faq/domain/repository/faq_repo.dart';
import 'package:bookia/features/faq/domain/usecases/get_faqs_usecase.dart';
import 'package:bookia/features/faq/presentation/cubit/faq_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => CheckForgetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerFactory(
    () => AuthCubit(
      loginUseCase: sl(),
      registerUseCase: sl(),
      forgetPasswordUseCase: sl(),
      checkForgetPasswordUseCase: sl(),
      resetPasswordUseCase: sl(),
    ),
  );

  // home
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));
  sl.registerLazySingleton(() => GetSliderUseCase(sl()));
  sl.registerLazySingleton(() => GetBestSellerUseCase(sl()));
  sl.registerFactory(
    () => HomeCubit(getSliderUseCase: sl(), getBestSellerUseCase: sl()),
  );

  // cart
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<CartRepo>(() => CartRepoImpl(sl()));
  sl.registerLazySingleton(() => GetCartUseCase(sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromCartUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCartUseCase(sl()));
  sl.registerLazySingleton(() => CheckoutUseCase(sl()));
  sl.registerFactory(
    () => CartCubit(
      getCartUseCase: sl(),
      removeFromCartUseCase: sl(),
      updateCartUseCase: sl(),
      checkoutUseCase: sl(),
    ),
  );

  // wishlist
  sl.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<WishlistRepo>(() => WishlistRepoImpl(sl()));
  sl.registerLazySingleton(() => GetWishlistUseCase(sl()));
  sl.registerLazySingleton(() => AddToWishlistUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromWishlistUseCase(sl()));
  sl.registerFactory(
    () => WishlistCubit(
      getWishlistUseCase: sl(),
      removeFromWishlistUseCase: sl(),
    ),
  );

  // book details
  sl.registerFactory(
    () => CartActionCubit(addToCartUseCase: sl(), removeFromCartUseCase: sl()),
  );
  sl.registerFactory(
    () => WishlistActionCubit(
      addToWishlistUseCase: sl(),
      removeFromWishlistUseCase: sl(),
    ),
  );

  // profile
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => EditProfileUseCase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
  sl.registerLazySingleton(() => GetOrdersUseCase(sl()));
  sl.registerFactory(
    () => ProfileCubit(
      getProfileUseCase: sl(),
      changePasswordUseCase: sl(),
      getOrdersUseCase: sl(),
    ),
  );
  sl.registerFactory(() => EditProfileCubit(editProfileUseCase: sl()));

  //place order
  sl.registerLazySingleton<PlaceOrderRemoteDataSource>(
    () => PlaceOrderRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<PlaceOrderRepo>(() => PlaceOrderRepoImpl(sl()));
  sl.registerLazySingleton(() => GetGovernoratesUseCase(sl()));
  sl.registerFactory(() => PlaceOrderCubit(getGovernoratesUseCase: sl()));

  //contact us
  sl.registerLazySingleton<ContactUsRemoteDataSource>(
    () => ContactUsRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ContactUsRepo>(() => ContactUsRepoImpl(sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerFactory(() => ContactUsCubit(sendMessageUseCase: sl()));

  //faq
  sl.registerLazySingleton<FaqRemoteDataSource>(
    () => FaqRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<FaqRepo>(() => FaqRepoImpl(sl()));
  sl.registerLazySingleton(() => GetFaqsUseCase(sl()));
  sl.registerFactory(() => FaqCubit(getFaqsUseCase: sl()));
}
