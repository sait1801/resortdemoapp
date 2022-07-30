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
        startDate = data['startDate'].toDate(),
        endDate = data['endDate'].toDate(),
        reservationType = resType(data['reservationType']),
        villaType = villa(data['villaType']);

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
  String toString() => '$id, $startDate,$endDate, $reservationType, $villaType';
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

VillaType villa(String type) {
  switch (type) {
    case 'ONWATERRESORT':
      return VillaType.ONWATERRESORT;

    case 'UNDERWATERBEDROOM':
      return VillaType.UNDERWATERBEDROOM;

    case 'APARTMENT':
      return VillaType.APARTMENT;
  }
  return VillaType.ONWATERRESORT;
}

ReservationType resType(String date) {
  switch (date) {
    case 'BUSINESS':
      return ReservationType.BUSINESS;

    case 'CUSTOMER':
      return ReservationType.CUSTOMER;
  }
  return ReservationType.CUSTOMER;
}
