import 'package:pocket_base_app/features/auth/data/auth_repo/auth_repo.dart';

import 'package:pocketbase/pocketbase.dart';

import '../../../../core/network/pocketbase_client.dart';

class AuthRepoImplement implements AuthRepo {
  final PocketBase pb;

  AuthRepoImplement({PocketBase? pb}) : pb = pb ?? PocketBaseService.pb;

  // Register
  @override
  Future<RecordModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    final record = await pb
        .collection('users')
        .create(
          body: {
            'name': name,
            'email': email,
            'password': password,
            'passwordConfirm': password,
          },
        );

    return record;
  }

  // Login
  @override
  Future<RecordModel> login({
    required String email,
    required String password,
  }) async {
    final result = await pb
        .collection('users')
        .authWithPassword(email, password);

    return result.record;
  }

  // Logout
  @override
  void logout() {
    pb.authStore.clear();
  }

  // Check if user is logged in
  @override
  bool get isLoggedIn {
    return pb.authStore.isValid;
  }

  // Current user
  @override
  RecordModel? get currentUser {
    return pb.authStore.record;
  }
}
