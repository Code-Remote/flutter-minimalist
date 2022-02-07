import 'package:flutter_minimalist/cupertino/SearchPageManager.dart';
import 'package:flutter_minimalist/cupertino/ShoppingCartPageManager.dart';
import 'package:flutter_minimalist/services/CartService.dart';
import 'package:flutter_minimalist/services/ProductService.dart';
import 'package:get_it/get_it.dart';

import 'cupertino/ProductPageManager.dart';

final getIt = GetIt.instance;

void setupGetIt() {

  getIt.registerLazySingleton<ProductService>(
          () => ProductService()
  );
  getIt.registerLazySingleton<CartService>(
          () => CartService()
  );

  getIt.registerLazySingleton<ProductPageManager>(
          () => ProductPageManager()
  );
  getIt.registerLazySingleton<SearchPageManager>(
          () => SearchPageManager()
  );
  getIt.registerLazySingleton<ShoppingCartPageManager>(
          () => ShoppingCartPageManager()
  );
}