import 'dart:convert';

import 'package:customer/features/users/domain/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserDataSource {
  Future<UserModel> getUser({
    required String id,
  });

  Future<List<UserModel>> getUsers();
}

class UserDataSourceImpl implements UserDataSource {
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
  Future<List<UserModel>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final dataDecode =
        response.body != "" ? json.decode(utf8.decode(response.bodyBytes)) : [];

    if (response.statusCode >= 200 && response.statusCode <= 204) {
      List<UserModel> usersList = [];

      dataDecode.forEach((element) {
        usersList.add(UserModel.fromJson(element));
      });

      return usersList;
    } else {
      throw Exception('Error al traer los datos');
    }
  }
}
