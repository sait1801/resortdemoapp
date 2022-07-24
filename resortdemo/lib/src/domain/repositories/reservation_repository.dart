import 'package:resortdemo/src/domain/entities/reservation.dart';

abstract class ReservationRepository {
  Future<void> createReservation(Reservation reservation);
  Future<List<Reservation>> readReservations();
  Future<void> updateReservation(Reservation reservation);
  Future<void> deleteReservation(String reservationId);
}
