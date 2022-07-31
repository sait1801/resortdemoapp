import 'package:resortdemo/src/domain/entities/reservation.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final List<Reservation>? reservations;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.reservations,
  );

  User.fromMap(Map<String, dynamic> data, String id)
      : id = id,
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'],
        reservations = data['reservations'];

  User.fromUser(User user)
      : id = user.id,
        firstName = user.firstName,
        lastName = user.lastName,
        email = user.email,
        reservations = user.reservations;

  List<Map<String, dynamic>>? reservationsToMap(
      List<Reservation> resrevations) {
    List<Map<String, dynamic>> reservationJson = [];
    for (Reservation res in resrevations) {
      reservationJson.add(res.toMap(res));
    }
  }

  @override
  String toString() => '$id, $firstName, $lastName, $email';

  Map<String, dynamic> toMap(User user, String password) {
    return {
      "id": user.id,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "email": user.email,
      "password": password,
      "reservations": reservationsToMap(user.reservations!),
    };
  }
}
