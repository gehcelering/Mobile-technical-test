class UserEntity {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String city;

  UserEntity(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.city});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone'],
      email: json['email'],
      city: json['address']['city'],
    );
  }
}
