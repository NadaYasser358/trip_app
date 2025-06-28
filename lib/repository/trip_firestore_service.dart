import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/data_models/trip_model.dart';

class TripFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Save a trip for the current user
  Future<void> saveTrip(TripModel trip) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User not logged in');
    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('trips')
        .add(trip.toJson());
  }

  // Fetch all trips for the current user
  Stream<List<TripModel>> getUserTrips() {
    final user = _auth.currentUser;
    if (user == null) {
      return const Stream.empty();
    }
    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('trips')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TripModel.fromJson(doc.data()))
            .toList());
  }
}
