import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class CreateReservation extends UseCase<void, CreateReservationParams> {
  final ReservationRepository _reservationRepository;

  CreateReservation(this._reservationRepository);

  late StreamController<void> _controller;

  @override
  Future<Stream<void>> buildUseCaseStream(
      CreateReservationParams? params) async {
    _controller = StreamController();

    try {
      await _reservationRepository.createReservation(params!.reservation);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }

    return _controller.stream;
  }
}

class CreateReservationParams {
  final Reservation reservation;
  CreateReservationParams(this.reservation);
}
