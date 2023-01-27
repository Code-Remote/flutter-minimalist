import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';

import '../ServiceLocator.dart';
import 'ProductListTab.dart';
import 'SearchTab.dart';
import 'ShoppingCartPageManager.dart';
import 'ShoppingCartTab.dart';

class CupertinoHomePage extends StatelessWidget {
  const CupertinoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ShoppingCartPageManager>();

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 64,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Products',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ValueListenableBuilder<Map<int, int>>(
                valueListenable: pageManager.cartNotifier,
                builder: (context, value, child) {
                  return Badge(
                    showBadge: pageManager.totalCartQuantity > 0,
                    badgeContent: Text('${pageManager.totalCartQuantity}'),
                    child: const Icon(CupertinoIcons.shopping_cart),
                  );
                }),
            label: 'Cart',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: ProductListTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: SearchTab(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: ShoppingCartTab(key: Key("piet")),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
