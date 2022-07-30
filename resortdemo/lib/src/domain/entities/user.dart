class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  );

  User.fromMap(Map<String, dynamic> data, String id)
      : id = id,
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'];

  User.fromUser(User user)
      : id = user.id,
        firstName = user.firstName,
        lastName = user.lastName,
        email = user.email;

  Map<String, dynamic> toMap(User user, String password) {
    return {
      "id": user.id,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "email": user.email,
      "password": password,
    };

    @override
    String toString() => '$id, $firstName, $lastName, $email';
  }
}
