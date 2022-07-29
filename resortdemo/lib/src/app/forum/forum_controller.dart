import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/forum/forum_presenter.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class ForumController extends Controller {
  final ForumPresenter _presenter;

  ForumController(
    ReservationRepository reservationRepository,
  ) : _presenter = ForumPresenter(reservationRepository);

  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late String contactNumber;
  late String email;

  @override
  void onInitState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();

    super.onInitState();
  }

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  @override
  void initListeners() {}

  void refreshScreeen() {
    refreshUI();
  }
}
