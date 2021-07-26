import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/retailer/home/application/retailer.dart';

class RetailerProvider extends ChangeNotifier {
  //want to add building name field for retailer?
  final List<Retailer> _retailerList = [
    const Retailer(
      name: "Bad & Poor Cake",
      block: "Bedok Town Center",
      street: "Bedok North Street 1",
      unit: "01-05",
      postalCode: "460209",
      operatingHours: "Monday - Sunday: 11:00am - 9:30pm",
      description: "Cake cake cake cake",
      image: "",
      visibility: true,
    ),
    const Retailer(
      name: "Sushi Regular - Bedok",
      block: "311 Bedok Mall",
      street: "New Upper Changi Road",
      unit: "02-021",
      postalCode: "467360",
      operatingHours: "Monday - Sunday: 9:00am - 10:30pm",
      description:
          "Sushi but not express. Many options to fulfill your sushi needs with the regular service speed. All additional texts will be handled by expanding this box",
      image: "",
      visibility: true,
    ),
    const Retailer(
      name: "WcDonalds",
      block: "311 Bedok Mall",
      street: "New Upper Changi Road Bedok Mall",
      unit: "01-056",
      postalCode: "467360",
      operatingHours: "Open 24hrs",
      description: "Vegan burgers and soggy fries",
      image: "",
      visibility: true,
    ),
    const Retailer(
      name: "Jall & Jick",
      block: "32A",
      street: "Chai Chee Ave",
      unit: "01-198",
      postalCode: "462032",
      operatingHours: "Monday - Sunday: 12:00pm - 9:00pm",
      description: "Melting ice cream",
      image: "",
      visibility: true,
    ),
  ];
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
// final retailerProvider = Provider<RetailerProvider>((ref) => throw UnimplementedError());
