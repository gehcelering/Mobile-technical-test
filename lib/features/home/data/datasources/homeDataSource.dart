import 'dart:convert';

import 'package:customer/core/models/user.dart';
import 'package:http/http.dart' as http;

import '../../../../core/models/usuarios_entity.dart';

abstract class HomeDataSource {
  Future<UserModel> traerUnUsuario({
    required String id,
  });

  Future<List<UsuariosEntity>> usuarios();
}

class HomedatasourceImpl implements HomeDataSource {
  @override
  Future<UserModel> traerUnUsuario({required String id}) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));

    final dataDecode =
        response.body != "" ? json.decode(utf8.decode(response.bodyBytes)) : [];

    if (response.statusCode >= 200 && response.statusCode <= 204) {
      return UserModel.fromJson(dataDecode);
    } else {
      throw Exception('Error al traer los datos');
    }
  }

  @override
  Future<List<UsuariosEntity>> usuarios() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final dataDecode =
        response.body != "" ? json.decode(utf8.decode(response.bodyBytes)) : [];

    if (response.statusCode >= 200 && response.statusCode <= 204) {
      List<UsuariosEntity> listado = [];

      dataDecode.forEach((element) {
        listado.add(UsuariosEntity.fromJson(element));
      });

      return listado;
    } else {
      throw Exception('Error al traer los datos');
    }
  }
}
