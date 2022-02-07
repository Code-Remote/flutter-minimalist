import 'package:flutter/cupertino.dart';
import 'package:flutter_minimalist/ServiceLocator.dart';
import 'package:flutter_minimalist/cupertino/ShoppingCartPageManager.dart';
import 'package:flutter_minimalist/cupertino/styles.dart';
import 'package:intl/intl.dart';

import '../model/Product.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    required this.index,
    required this.product,
    required this.lastItem,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  final Product product;
  final int index;
  final bool lastItem;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    var pageManager = getIt<ShoppingCartPageManager>();
    final row = SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 8,
          bottom: 8,
          right: 8,
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: Styles.productRowItemName,
                        ),
                        Text(
                          pageManager.formatTotalProductPrice(quantity, product.price),
                          style: Styles.productRowItemName,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      pageManager.formatQuantityCalculation(quantity, product.price),
                      style: Styles.productRowItemPrice,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return row;
  }


}