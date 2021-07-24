import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';

class ProductList extends ChangeNotifier {
  List<Product> _productList = [];
  List<Product> get productList => _productList;

  void add() {
    notifyListeners();
  }

  void edit() {
    notifyListeners();
  }

  void delete() {
    notifyListeners();
  }
}

final ProductsProvider = ChangeNotifierProvider((ref) => ProductList());