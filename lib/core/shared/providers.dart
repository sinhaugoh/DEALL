import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final internetConnectionCheckerProvider = Provider((ref) => InternetConnectionChecker());