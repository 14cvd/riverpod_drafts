import 'package:dio/dio.dart';
import 'package:flutter_application_3/model/userModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<List<UserModel>> {
  UserNotifier() : super([]);

  Future<List<UserModel>> fetchUserItem() async {
    var response =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      var data = response.data;
      if (data is List) {
        state = data.map((e) => UserModel.fromJson(e)).toList();

        return [...state];
      }
    }

    return [];
  }

  List<UserModel> remove(UserModel user) {
    return state.where((element) => element.id != user.id).toList();
  }
}
