import 'package:flutter/material.dart';
import 'package:flutter_api_demo/pages/home/home_page.dart';
import 'package:flutter_api_demo/pages/login/login_page.dart';
import 'package:flutter_api_demo/pages/users/add_user_page.dart';
import 'package:flutter_api_demo/pages/users/detail_user_page.dart';
import 'package:flutter_api_demo/pages/users/users_page.dart';
import 'package:flutter_api_demo/repositories/users_repository.dart';
import 'package:flutter_api_demo/services/auth_service.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final authService = AuthService();

final routes = GoRouter(
  initialLocation: '/users',
  refreshListenable: authService,
  redirect: (state) {
    final isAuthenticated = authService.isAuthenticated;
    final isLoginRoute = state.subloc == '/login';

    if (!isAuthenticated) {
      return isLoginRoute ? null : '/login';
    }

    if (isLoginRoute) return '/users';

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => const UsersPage(),
    ),
    GoRoute(
      path: '/users/add',
      // builder: (context, state) => const AddUserPage(),
      pageBuilder: (context, state) => const MaterialPage(
        child: AddUserPage(),
        fullscreenDialog: true,
      ),
    ),
    GoRoute(
      path: '/users/:userId',
      builder: (context, state) {
        final user = context.read<UsersRepository>().users.firstWhere(
              (user) => user.id == state.params['userId']!,
            );

        return DetailUserPage(user: user);
      },
    ),
  ],
);
