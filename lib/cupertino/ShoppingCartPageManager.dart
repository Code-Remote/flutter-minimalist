import 'package:flutter/cupertino.dart';
import 'package:flutter_minimalist/ServiceLocator.dart';
import 'package:flutter_minimalist/services/CartService.dart';
import 'package:intl/intl.dart';

class ShoppingCartPageManager {
  final _cartService = getIt<CartService>();
  final _currencyFormat = NumberFormat.currency(symbol: '\$');

  late final ValueNotifier<Map<int, int>> cartNotifier = _cartService.cartNotifier;

  get totalCartQuantity => _cartService.totalCartQuantity;

  get formattedShippingCosts => _currencyFormat.format(_cartService.shippingCost);

  get formattedTaxes => _currencyFormat.format(_cartService.tax);

  get formatTotalOrderCosts => _currencyFormat.format(_cartService.totalCartQuantity);

  String formatTotalProductPrice(int quantity, int price) =>
      _currencyFormat.format(quantity * price);

  String formatQuantityCalculation(quantity, price) => '${quantity > 1 ? '$quantity x ' : ''}'
      '${_currencyFormat.format(price)}';
}
