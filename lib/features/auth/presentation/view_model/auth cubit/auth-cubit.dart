// ignore: file_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_base_app/features/auth/data/auth_repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // Register
  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(AuthLoading());
    try {
      final user = await authRepo.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirm: passwordConfirmController.text,
      );

      emit(AuthSuccess(user));
      log("*************************************");
      log("${authRepo.currentUser!}");
    } catch (e) {
      emit(AuthFailure(_getErrorMessage(e)));
    }
  }

  // Login
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      final user = await authRepo.login(email: email, password: password);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(_getErrorMessage(e)));
    }
  }

  // Logout
  void logout() {
    authRepo.logout();

    emit(AuthLoggedOut());
  }

  String _getErrorMessage(Object error) {
    return error.toString();
  }
}
