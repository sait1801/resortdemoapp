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
  late String selectedVillaName;
  String? selectedVillaDescription;
  DateTimeRange? newDateRange;
  VillaType? villaType;
  ReservationType? reservationType;

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

  void datePicking(Size size, BuildContext context, GlobalKey key) async {
    switch (selectedVillaName) {
      case 'Onwater Villa':
        villaType = VillaType.ONWATERRESORT;
        reservationType = ReservationType.CUSTOMER;
        print('villaType:$villaType, reservationType: $reservationType');

        break;
      case 'Weekend Apartments':
        villaType = VillaType.APARTMENT;
        reservationType = ReservationType.CUSTOMER;

        break;
      case 'Underwater Bedroom':
        villaType = VillaType.UNDERWATERBEDROOM;
        reservationType = ReservationType.BUSINESS;

        break;
    }
    newDateRange = await showDateRangePicker(
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

    print('$newDateRange, $reservationType, $villaType');

    _presenter.createReservation(
      Reservation(
        newDateRange!.start,
        newDateRange!.end,
        reservationType!,
        villaType!,
        DateTime.now().toIso8601String(),
      ),
    );
  }
}
