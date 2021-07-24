import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/retailer/home/application/retailer.dart';

class RetailerProvider extends ChangeNotifier {
  List<Retailer> _retailerList = [];
  List<Retailer> get retailerList => _retailerList;

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

final retailerProvider = ChangeNotifierProvider((ref) => RetailerProvider());