import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimalist/ServiceLocator.dart';
import 'package:flutter_minimalist/cupertino/ShoppingCartPageManager.dart';
import 'package:flutter_minimalist/cupertino/styles.dart';
import 'package:intl/intl.dart';

import '../services/CartService.dart';

class ShoppingCartPriceItem extends StatelessWidget {
  const ShoppingCartPriceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ShoppingCartPageManager>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Shipping '
                '${pageManager.formattedShippingCosts}',
                style: Styles.productRowItemPrice,
              ),
              const SizedBox(height: 6),
              Text(
                'Tax ${pageManager.formattedTaxes}',
                style: Styles.productRowItemPrice,
              ),
              const SizedBox(height: 6),
              Text(
                'Total ${pageManager.formatTotalOrderCosts}',
                style: Styles.productRowTotal,
              ),
            ],
          )
        ],
      ),
    );
  }
}
