import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class DataReservationRepository implements ReservationRepository {
  static final _instance = DataReservationRepository._internal();
  DataReservationRepository._internal();
  factory DataReservationRepository() => _instance;

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference userReferance =
      FirebaseFirestore.instance.collection("user");

  CollectionReference reservationReferencce =
      FirebaseFirestore.instance.collection("reservations");

  List<Reservation> reservations = [];

  @override
  Future<void> createReservation(Reservation reservation) async {
    try {
      reservations.add(reservation);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteReservation(String reservationId) {
    // TODO: implement deleteReservation
    throw UnimplementedError();
  }

  @override
  Future<List<Reservation>> readReservations() {
    // TODO: implement readReservations
    throw UnimplementedError();
  }

  @override
  Future<void> updateReservation(Reservation reservation) {
    // TODO: implement updateReservation
    throw UnimplementedError();
  }
}
