class User {
  final String user_name;
  final String email;
  final String first_name;
  final String last_name;
  final String password;
  final String password2;
  final date_of_birth;
  final String language;
  final String phone_number;

  const User({
    required this.user_name,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.password,
    required this.password2,
    required this.date_of_birth,
    required this.language,
    required this.phone_number,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        user_name: json['user_name'],
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        password: json['password'],
        password2: json['password2'],
        date_of_birth: json['date_of_birth'],
        language: json['language'],
        phone_number: json['phone_number']);
  }

  static User fromSnap(snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        user_name: snapshot['user_name'],
        email: snapshot['email'],
        first_name: snapshot['first_name'],
        last_name: snapshot['last_name'],
        password: snapshot['password'],
        password2: snapshot['password2'],
        date_of_birth: snapshot['date_of_birth'],
        language: snapshot['language'],
        phone_number: snapshot['phone_number']);
  }


}
