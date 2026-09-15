import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_base_app/features/auth/data/auth_repo/auth_repo_implement.dart';
import 'package:pocket_base_app/features/auth/presentation/view_model/auth%20cubit/auth-cubit.dart';
import 'package:pocket_base_app/features/auth/presentation/views/signin_view.dart';
import 'package:pocket_base_app/features/auth/presentation/views/signup_view.dart';
import 'package:pocket_base_app/features/home/presentation/views/home_view.dart';
import 'package:pocket_base_app/features/splash/presentation/views/onboarding_view.dart';
import 'package:pocket_base_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  // static const splashPath = '/';
  static const splashPath = '/';
  static const onboardingPath = '/onboardingPath';
  static const signInPath = '/signInPath';
  static const signUpPath = '/signUpPath';
  static const homePath = '/homePath';
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
    

      GoRoute(
        path: splashPath,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: onboardingPath,
        builder: (BuildContext context, GoRouterState state) {
          return OnboardingView();
        },
      ),
      GoRoute(
        path: signInPath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthCubit(authRepo: AuthRepoImplement()),
            child: SigninView(),
          );
        },
      ),
      GoRoute(
        path: signUpPath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthCubit(authRepo: AuthRepoImplement()),
            child: SignupView(),
          );
        },
      ),

      GoRoute(
        path: homePath,
        builder: (BuildContext context, GoRouterState state) {
          return HomeView();
        },
      ),
    ],
  );
}
