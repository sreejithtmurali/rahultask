import 'package:cloud_firestore/cloud_firestore.dart';

class LocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addLocation(String country, String state, String district, String city) async {
    await _firestore.collection('locations').add({
      'country': country,
      'state': state,
      'district': district,
      'city': city,
    });
  }
}
