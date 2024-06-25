import 'dart:convert';

import 'package:customer/data/datasources/ihome_datasource.dart';
import 'package:customer/data/models/user.dart';
import 'package:http/http.dart' as http;

import '../../../domain/entities/usuarios_entity.dart';

class HomeDataSourceImpl implements IHomeDataSource {
  @override
  Future<UserModel> getUser({required String id}) async {
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
  Future<List<UserEntity>> getAllUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final dataDecode =
        response.body != "" ? json.decode(utf8.decode(response.bodyBytes)) : [];

    if (response.statusCode >= 200 && response.statusCode <= 204) {
      List<UserEntity> listado = [];

      dataDecode.forEach((element) {
        listado.add(UserEntity.fromJson(element));
      });

      return listado;
    } else {
      throw Exception('Error al traer los datos');
    }
  }
}
