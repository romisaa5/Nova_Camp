import 'package:api/models/user.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();
  String baseUrl = 'https://api.escuelajs.co/api/v1/';
  Future<List<User>> fetchData() async {
    try {
      final response = await dio.get('${baseUrl}users');
      List<User> users = (response.data as List)
          .map((json) => User.fromJson(json))
          .toList();

      return users;
    } catch (e) {
      throw Exception;
    }
  }

  Future<String> addUser({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    try {
      final response = await dio.post(
        '${baseUrl}users/',
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': '*/*',
          },
        ),
        data: {
          "name": name,
          "email": email,
          "password": password,
          "avatar": avatar,
        },
      );
      return response.data['role'];
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> updateUser({
    required String name,
    required String email,
    required String id,
  }) async {
    try {
      final response = await dio.put(
        '${baseUrl}users/$id',
        data: {"name": name, "email": email},
      );
      return response.data['name'];
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
