import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';
import 'package:resortdemo/src/domain/usecases/create_reservation.dart';
import 'package:resortdemo/src/domain/usecases/delete_reservation.dart';
import 'package:resortdemo/src/domain/usecases/get_reservations.dart';
import 'package:resortdemo/src/domain/usecases/update_reservation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  late Function createReservationOnComplete;
  late Function updateReservationOnComplete;
  late Function cancelReservationOnComplete;
  late Function getReservationsOnNext;

  late Function createReservationOnError;
  late Function updateReservationOnError;
  late Function cancelReservationOnError;
  late Function getReservationsOnError;

  final GetReservations _getReservations;
  final CreateReservation _createReservation;
  final CancelReservation _cancelReservation;
  final UpdateReservation _updateReservation;

  HomePresenter(ReservationRepository _reservationRepository)
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

  void createReservation(Reservation reservation) {
    _createReservation.execute(_CreateReservationsObserver(this),
        CreateReservationParams(reservation));
  }
}

class _GetReservationsObserver extends Observer<List<Reservation>> {
  final HomePresenter _presenter;

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
  final HomePresenter _presenter;

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
  final HomePresenter _presenter;

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

class _CreateReservationsObserver extends Observer<List<Reservation>> {
  final HomePresenter _presenter;

  _CreateReservationsObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.createReservationOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getReservationsOnError(e);
  }

  @override
  void onNext(void response) {}
}
