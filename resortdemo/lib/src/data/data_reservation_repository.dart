import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resortdemo/src/data/data_user_repository.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class DataReservationRepository implements ReservationRepository {
  static final _instance = DataReservationRepository._internal();
  DataReservationRepository._internal();
  factory DataReservationRepository() => _instance;

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference userReferance =
      FirebaseFirestore.instance.collection("user");

  CollectionReference reservationReference =
      FirebaseFirestore.instance.collection("reservations");

  String? userId;
  List<Reservation> reservations = [
    Reservation(
      DateTime(2022),
      DateTime(2022),
      ReservationType.CUSTOMER,
      VillaType.ONWATERRESORT,
      "1",
    ),
    Reservation(
      DateTime(2022),
      DateTime(2022),
      ReservationType.CUSTOMER,
      VillaType.ONWATERRESORT,
      "2",
    ),
    Reservation(
      DateTime(2022),
      DateTime(2022),
      ReservationType.CUSTOMER,
      VillaType.ONWATERRESORT,
      "3",
    ),
    Reservation(
      DateTime(2022),
      DateTime(2022),
      ReservationType.CUSTOMER,
      VillaType.ONWATERRESORT,
      "4",
    )
  ];

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
  Future<void> deleteReservation(String reservationId) async {
    reservations.removeWhere((element) => element.id == reservationId);
  }

  @override
  Future<List<Reservation>> readReservations() async {
    try {
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
  }
}
