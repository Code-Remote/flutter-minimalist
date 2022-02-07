import 'package:flutter/cupertino.dart';
import 'package:flutter_minimalist/services/CartService.dart';

import '../ServiceLocator.dart';
import '../model/Product.dart';
import '../services/ProductService.dart';

class ProductPageManager {

  final _cartService = getIt<CartService>();
  final productNotifier = ValueNotifier<List<Product>>(List.empty());

  void loadProducts() {
    productNotifier.value = ProductService.loadProducts(Category.all);
  }

  void addProductToCart(int id) {
    _cartService.addProductToCart(id);
  }
}
