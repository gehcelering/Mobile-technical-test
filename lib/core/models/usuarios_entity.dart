class UsuariosEntity {
  final int id;
  final String name;

  UsuariosEntity({required this.id, required this.name});

  factory UsuariosEntity.fromJson(Map<String, dynamic> json) {
    return UsuariosEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}
