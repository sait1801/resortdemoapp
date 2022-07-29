import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';
import 'package:resortdemo/src/domain/usecases/create_reservation.dart';
import 'package:resortdemo/src/domain/usecases/delete_reservation.dart';
import 'package:resortdemo/src/domain/usecases/get_reservations.dart';
import 'package:resortdemo/src/domain/usecases/update_reservation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ForumPresenter extends Presenter {
  final GetReservations _getReservations;
  final CreateReservation _createReservation;
  final CancelReservation _cancelReservation;
  final UpdateReservation _updateReservation;

  ForumPresenter(ReservationRepository _reservationRepository)
      : _getReservations = GetReservations(_reservationRepository),
        _cancelReservation = CancelReservation(_reservationRepository),
        _updateReservation = UpdateReservation(_reservationRepository),
        _createReservation = CreateReservation(_reservationRepository);

  @override
  void dispose() {
    _getReservations.dispose();
    _updateReservation.dispose();
    _createReservation.dispose();
    _cancelReservation.dispose();
  }
}
