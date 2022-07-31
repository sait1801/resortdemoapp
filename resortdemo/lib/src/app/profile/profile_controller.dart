import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/profile/profile_presenter.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class ProfileController extends Controller {
  final ProfilePresenter _presenter;

  ProfileController(
    ReservationRepository reservationRepository,
  ) : _presenter = ProfilePresenter(reservationRepository);

  List<Reservation> reservations = [];
  int bottomNavIndex = 3;
  bool isVillaDetails = false;

  late PageController pageController;

  @override
  void onInitState() {
    pageController = PageController(initialPage: 0);

    _presenter.getReservations();
    super.onInitState();
  }

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  @override
  void initListeners() {
    _presenter.getReservationsOnNext = (List<Reservation> response) {
      this.reservations = response;
      refreshUI();
    };

    _presenter.getReservationsOnError = (e) {
      print("BURAYA PRIMARY POP UP YAZ");
    };

    _presenter.updateReservationOnComplete = () {
      _presenter.getReservations();
      refreshUI();
    };

    _presenter.updateReservationOnError = (e) {
      print("BURAYA PRIMARY POP UP YAZ");
    };

    _presenter.cancelReservationOnComplete = () {
      _presenter.getReservations();
      refreshUI();
    };

    _presenter.cancelReservationOnError = (e) {
      print("BURAYA PRIMARY POP UP YAZ");
    };
  }

  void refreshScreeen() {
    refreshUI();
  }

  void cancelReservation(String id) {
    _presenter.cancelReservation(id);
  }

  void updateReservation(Reservation reservation) {
    _presenter.updateReservation(reservation);
  }

  void getReservations() {
    _presenter.getReservations();
  }

  Future<void> changeDate(BuildContext context, Size size, GlobalKey key,
      Reservation reservation) async {
    var newDateRange = await showDateRangePicker(
      context: context,
      builder: (context, child) {
        return Center(
          child: SizedBox(
            width: size.width * 0.7,
            height: size.height * 0.6,
            child: Theme(
              key: key,
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.yellow, // header background color
                  onPrimary: Colors.black, // header text color
                  onSurface: Colors.green, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // button text color
                  ),
                ),
              ),
              child: child!,
            ),
          ),
        );
      },
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    var updatedReservation = Reservation(newDateRange!.start, newDateRange.end,
        reservation.reservationType, reservation.villaType, reservation.id);

    _presenter.updateReservation(updatedReservation);

    _presenter.getReservations();

    refreshUI();
  }
}
