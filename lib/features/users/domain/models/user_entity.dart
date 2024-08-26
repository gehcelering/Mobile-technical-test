class UserEntity {
  final int id;
  final String name;

  UserEntity({required this.id, required this.name});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}
