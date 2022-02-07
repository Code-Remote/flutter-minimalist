import 'package:flutter/cupertino.dart';
import 'package:flutter_minimalist/ServiceLocator.dart';
import 'package:flutter_minimalist/services/CartService.dart';
import 'package:intl/intl.dart';

class ShoppingCartPageManager {
  final _cardService = getIt<CartService>();
  final _currencyFormat = NumberFormat.currency(symbol: '\$');

  late final ValueNotifier<Map<int, int>> cartNotifier =
      _cardService.cartNotifier;

  get formattedShippingCosts => _currencyFormat.format(_cardService.shippingCost);

  get formattedTaxes => _currencyFormat.format(_cardService.tax);

  get formatTotalOrderCosts => _currencyFormat.format(_cardService.totalCartQuantity);

  String formatTotalProductPrice(int quantity, int price) =>
      _currencyFormat.format(quantity * price);

  String formatQuantityCalculation(quantity, price) =>
      '${quantity > 1 ? '$quantity x ' : ''}'
      '${_currencyFormat.format(price)}';
}
