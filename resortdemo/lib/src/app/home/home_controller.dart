import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/home/home_presenter.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';
import 'package:resortdemo/src/domain/repositories/reservation_repository.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(
    ReservationRepository reservationRepository,
  ) : _presenter = HomePresenter(reservationRepository);

  List<Reservation> reservations = [];
  int bottomNavIndex = 3;
  bool isVillaDetails = false;

  late PageController pageController;
  String? topImagePath;
  String? selectedVillaName;
  String? selectedVillaDescription;

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

    _presenter.createReservationOnComplete = () {
      _presenter.getReservations();
      refreshUI();
    };

    _presenter.createReservationOnError = () {
      print("BURAYA PRIMARY POP UP YAZ");
    };
  }

  void refreshScreeen() {
    refreshUI();
  }

  void createReservation(Reservation reservation) {
    _presenter.createReservation(reservation);
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
}
