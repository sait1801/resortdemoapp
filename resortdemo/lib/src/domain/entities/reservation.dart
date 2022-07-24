class Reservation {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final ReservationType reservationType;
  final VillaType villaType;

  Reservation(this.startDate, this.endDate, this.reservationType,
      this.villaType, this.id);
}

enum ReservationType {
  CUSTOMER,
  BUSINESS,
}

enum VillaType {
  ONWATERRESORT,
  UNDERWATERBEDROOM,
  APARTMENT,
}
