class Reservation {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final ReservationType reservationType;
  final VillaType villaType;

  Reservation(this.startDate, this.endDate, this.reservationType,
      this.villaType, this.id);

  Reservation.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        startDate = data['startDate'],
        endDate = data['endDate'],
        reservationType = data['reservationType'],
        villaType = data['villaType'];

  Map<String, dynamic> toMap(Reservation reservation) {
    return {
      "id": reservation.id,
      "startDate": reservation.startDate,
      "endDate": reservation.endDate,
      "reservationType": reservation.reservationType.toString(),
      "villaType": reservation.villaType.toString(),
    };
  }

  @override
  String toString() =>
      '$id, $startDate,$endDate, $reservationType, $reservationType';
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
