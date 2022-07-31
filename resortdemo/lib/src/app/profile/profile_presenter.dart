import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';
import 'package:resortdemo/src/domain/usecases/delete_reservation.dart';
import 'package:resortdemo/src/domain/usecases/get_reservations.dart';
import 'package:resortdemo/src/domain/usecases/update_reservation.dart';

class ProfilePresenter extends Presenter {
  late Function updateReservationOnComplete;
  late Function cancelReservationOnComplete;
  late Function getReservationsOnNext;

  late Function updateReservationOnError;
  late Function cancelReservationOnError;
  late Function getReservationsOnError;

  final GetReservations _getReservations;
  final CancelReservation _cancelReservation;
  final UpdateReservation _updateReservation;

  ProfilePresenter(ReservationRepository _reservationRepository)
      : _getReservations = GetReservations(_reservationRepository),
        _cancelReservation = CancelReservation(_reservationRepository),
        _updateReservation = UpdateReservation(_reservationRepository);

  @override
  void dispose() {
    _getReservations.dispose();
    _updateReservation.dispose();
    _cancelReservation.dispose();
  }

  void getReservations() {
    _getReservations.execute(_GetReservationsObserver(this));
  }

  void cancelReservation(String id) {
    _cancelReservation.execute(
        _CancelReservationsObserver(this), CancelReservationParams(id));
  }

  void updateReservation(Reservation reservation) {
    _updateReservation.execute(_UpdateReservationsObserver(this),
        UpdateReservationParams(reservation));
  }
}

class _GetReservationsObserver extends Observer<List<Reservation>> {
  final ProfilePresenter _presenter;

  _GetReservationsObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getReservationsOnError(e);
  }

  @override
  void onNext(List<Reservation>? response) {
    _presenter.getReservationsOnNext(response);
  }
}

class _CancelReservationsObserver extends Observer<List<Reservation>> {
  final ProfilePresenter _presenter;

  _CancelReservationsObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.cancelReservationOnComplete();
  }

  @override
  void onError(e) {
    _presenter.cancelReservationOnError(e);
  }

  @override
  void onNext(void response) {}
}

class _UpdateReservationsObserver extends Observer<List<Reservation>> {
  final ProfilePresenter _presenter;

  _UpdateReservationsObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.updateReservationOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getReservationsOnError(e);
  }

  @override
  void onNext(void response) {}
}
