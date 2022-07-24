import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class GetReservations extends UseCase<List<Reservation>, void> {
  final ReservationRepository _reservationRepository;

  late StreamController<List<Reservation>> _controller;

  GetReservations(this._reservationRepository);

  @override
  Future<Stream<List<Reservation>>> buildUseCaseStream(void params) async {
    _controller = StreamController();

    try {
      final List<Reservation> tasks =
          await _reservationRepository.readReservations();
      _controller.add(tasks);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
