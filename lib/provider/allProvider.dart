import 'package:flutter_application_3/model/userModel.dart';
import 'package:flutter_application_3/provider/notifier/userNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, List<UserModel>>(
        (ref) => UserNotifier());
