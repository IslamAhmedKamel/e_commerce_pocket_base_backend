import 'package:pocketbase/pocketbase.dart';

abstract class AuthRepo {
  Future<RecordModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
  });
  Future<RecordModel> login({required String email, required String password});

  void logout();
  bool get isLoggedIn;
  RecordModel? get currentUser;
}
