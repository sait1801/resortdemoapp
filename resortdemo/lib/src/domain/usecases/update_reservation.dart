import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class UpdateReservation extends UseCase<void, UpdateReservationParams> {
  final ReservationRepository _reservationRepository;

  UpdateReservation(this._reservationRepository);

  late StreamController<void> _controller;

  @override
  Future<Stream> buildUseCaseStream(params) async {
    _controller = StreamController();

    try {
      await _reservationRepository.updateReservation(params!.reservation);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }

    return _controller.stream;
  }
}

class UpdateReservationParams {
  final Reservation reservation;

  UpdateReservationParams(this.reservation);
}
