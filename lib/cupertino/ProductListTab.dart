import 'package:flutter/cupertino.dart';
import 'package:flutter_minimalist/ServiceLocator.dart';

import '../model/Product.dart';
import 'ProductPageManager.dart';
import 'ProductRowItem.dart';

class ProductListTab extends StatelessWidget {
  const ProductListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = getIt<ProductPageManager>();
    pageController.loadProducts(); // NEW

    return ValueListenableBuilder<List<Product>>(
        valueListenable: pageController.productNotifier,
        builder: (context, products, child) {
          return CustomScrollView(
            semanticChildCount: products.length, // NEW
            slivers: <Widget>[
              const CupertinoSliverNavigationBar(
                largeTitle: Text('Cupertino Store'),
              ),
              SliverSafeArea( // BEGINNING OF NEW CONTENT
                top: false,
                minimum: const EdgeInsets.only(top: 8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      if (index < products.length) {
                        return ProductRowItem(
                          product: products[index],
                          lastItem: index == products.length - 1,
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ) // END OF NEW CONTENT
            ],
          );
        });
  }
}
