// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimalist/services/ProductService.dart';

import '../model/Product.dart';

class CartService {
  final double _salesTaxRate = 0.06;
  final double _shippingCostPerItem = 7;

  // The IDs and quantities of products currently in the cart.
  final cartNotifier = ValueNotifier<Map<int, int>>({});

  // All the available products.
  List<Product> _availableProducts = ProductService.loadProducts(Category.all);

  // The currently selected category of products.
  Category _selectedCategory = Category.all;

  // Total number of items in the cart.
  int get totalCartQuantity {
    return cartNotifier.value.values.fold(0, (accumulator, value) {
      return accumulator + value;
    });
  }

  Category get selectedCategory {
    return _selectedCategory;
  }

  // Totaled prices of the items in the cart.
  double get subtotalCost {
    return cartNotifier.value.keys.map((id) {
      // Extended price for product line
      return getProductById(id).price * cartNotifier.value[id]!;
    }).fold(0, (accumulator, extendedPrice) {
      return accumulator + extendedPrice;
    });
  }

  // Total shipping cost for the items in the cart.
  double get shippingCost {
    return _shippingCostPerItem *
        cartNotifier.value.values.fold(0.0, (accumulator, itemCount) {
          return accumulator + itemCount;
        });
  }

  // Sales tax for the items in the cart
  double get tax {
    return subtotalCost * _salesTaxRate;
  }

  // Total cost to order everything in the cart.
  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }

  // Returns a copy of the list of available products, filtered by category.
  List<Product> getProducts() {
    if (_selectedCategory == Category.all) {
      return List.from(_availableProducts);
    } else {
      return _availableProducts.where((p) {
        return p.category == _selectedCategory;
      }).toList();
    }
  }

  // Search the product catalog
  List<Product> search(String searchTerms) {
    return getProducts().where((product) {
      return product.name.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }

  // Adds a product to the cart.
  void addProductToCart(int productId) {
    Map<int, int> cartUpdated = Map.from(cartNotifier.value);
    if (!cartNotifier.value.containsKey(productId)) {
      cartUpdated[productId] = 1;
    } else {
      cartUpdated[productId] = cartNotifier.value[productId]! + 1;
    }
    cartNotifier.value = cartUpdated;
  }

  // Removes an item from the cart.
  void removeItemFromCart(int productId) {
    if (cartNotifier.value.containsKey(productId)) {
      if (cartNotifier.value[productId] == 1) {
        cartNotifier.value.remove(productId);
      } else {
        cartNotifier.value[productId] = cartNotifier.value[productId]! - 1;
      }
    }
  }

  // Returns the Product instance matching the provided id.
  Product getProductById(int id) {
    return _availableProducts.firstWhere((p) => p.id == id);
  }

  // Removes everything from the cart.
  void clearCart() {
    cartNotifier.value.clear();
  }

  // Loads the list of available products from the repo.
  void loadProducts() {
    _availableProducts = ProductService.loadProducts(_selectedCategory);
  }

  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
  }
}
