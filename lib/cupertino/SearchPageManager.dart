import 'package:flutter_minimalist/ServiceLocator.dart';
import 'package:flutter_minimalist/services/CartService.dart';

import '../model/Product.dart';

class SearchPageManager{

  final cartService = getIt<CartService>();

  List<Product> search(String terms) {
    return cartService.search(terms);
  }
}