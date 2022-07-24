import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class CancelReservation extends UseCase<void, CancelReservationParams> {
  final ReservationRepository _reservationRepository;
  CancelReservation(this._reservationRepository);

  late StreamController<void> _controller;

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    _controller = StreamController();
    try {
      await _reservationRepository.deleteReservation(params!.id);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }
    return _controller.stream;
  }
}

class CancelReservationParams {
  final String id;
  CancelReservationParams(this.id);
}
