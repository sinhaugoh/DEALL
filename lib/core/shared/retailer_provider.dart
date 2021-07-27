import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deall/core/application/retailer.dart';

class RetailerProvider extends ChangeNotifier {
  Future<List<Retailer>?> getRetailerList() async {
    final CollectionReference retailers = FirebaseFirestore.instance.collection('retailers');

    final HashMap<dynamic, Retailer> retailerHashMap =
        HashMap<dynamic, Retailer>();
    await retailers.get().then((querySnapshot) {
      for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
        retailerHashMap.putIfAbsent(
            doc["name"],
            () => Retailer(
                  name: doc["name"].toString(),
                  block: doc["block"].toString(),
                  street: doc["street"].toString(),
                  unit: doc["unit"].toString(),
                  postalCode: doc["postalCode"].toString(),
                  operatingHours: doc["operatingHours"].toString(),
                  description: doc["description"].toString(),
                  image: doc["image"].toString(),
                  visibility:
                      doc["visibility"].toString().toLowerCase() == "true",
                ));
      }
    });
    return retailerHashMap.values.toList();
  }
}

final retailerProvider = ChangeNotifierProvider((ref) => RetailerProvider());
// final retailerProvider = Provider<RetailerProvider>((ref) => throw UnimplementedError());
