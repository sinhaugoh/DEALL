import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/retailer/home/application/product.dart';

class ProductProvider extends ChangeNotifier {
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

final productProvider = ChangeNotifierProvider((ref) => ProductProvider());