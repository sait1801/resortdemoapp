import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resortdemo/src/data/data_authentication_repository.dart';
import 'package:resortdemo/src/data/data_user_repository.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class DataReservationRepository implements ReservationRepository {
  static final _instance = DataReservationRepository._internal();
  DataReservationRepository._internal();
  factory DataReservationRepository() => _instance;

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference userReferance =
      FirebaseFirestore.instance.collection("users");

  CollectionReference reservationReference =
      FirebaseFirestore.instance.collection("reservations");

  List<Reservation> reservations = [];

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<void> createReservation(Reservation reservation) async {
    try {
      print('reztype: ${reservation.reservationType}');
      reservations.add(reservation);
      await reservationReference.doc(reservation.id).set(
            reservation.toMap(reservation),
          );

      List<Map<String, dynamic>> reservationToJson = [];

      print(userId);

      for (Reservation res in reservations) {
        reservationToJson.add(res.toMap(reservation));
      }

      await userReferance.doc(userId).set({'reservations': reservationToJson});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteReservation(String reservationId) async {
    try {
      reservations.removeWhere((element) => element.id == reservationId);
      await reservationReference.doc(reservationId).delete();

      await userReferance
          .doc(userId)
          .collection('reservations')
          .doc(reservationId)
          .delete();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Reservation>> readReservations() async {
    try {
      reservations = [];
      final pastReservationsSnapshot =
          await userReferance.doc(userId).collection('reservations').get();
      if (pastReservationsSnapshot.docs.isNotEmpty) {
        pastReservationsSnapshot.docs.forEach((doc) {
          Reservation reservationToAdd = Reservation.fromMap(doc.data());
          reservations.add(reservationToAdd);
        });
      }

      print('RESERVATIONS: $reservations');

      return reservations;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> updateReservation(Reservation reservation) async {
    final int index =
        reservations.indexWhere((element) => element.id == reservation.id);
    reservations[index] = reservation;

    await reservationReference
        .doc(reservation.id)
        .set(reservation.toMap(reservation));

    await userReferance
        .doc(userId)
        .collection('reservations')
        .doc(reservation.id)
        .set(reservation.toMap(reservation));
  }
}
