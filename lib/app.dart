import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_bloc/features/auth/data/api_auth_repository.dart';
import 'package:social_media_bloc/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_bloc/features/auth/presentation/cubits/auth_state.dart';
import 'package:social_media_bloc/features/auth/presentation/pages/login_page.dart';
import 'package:social_media_bloc/features/dashboard/presentation/components/bottom_menu/bloc/bottom_menu_bloc.dart';
import 'package:social_media_bloc/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:social_media_bloc/features/profile/data/api_profile_repository.dart';
import 'package:social_media_bloc/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:social_media_bloc/themes/cubits/theme_cubit.dart';

/*
APP – Root Level
================

Repositories: for the database
  - Laravel

Bloc Providers: for state management
  - auth
  - profile
  - post
  - search
  - theme

Check Auth State
  - unauthenticated -> auth page (login/register)
  - authenticated -> home page
*/

class MainApp extends StatelessWidget {
  // Repository
  final apiAuthRepository = ApiAuthRepository();
  final apiProfileRepository = ApiProfileRepository();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide Cubit ke Aplikasi
    return MultiBlocProvider(
      providers: [
        // Auth Cubit
        BlocProvider(
          create: (context) =>
              AuthCubit(apiAuthRepository: apiAuthRepository)..checkAuth(),
        ),

        // BottomMenu Cubit
        BlocProvider(create: (context) => BottomMenuBloc()),

        // Profile Cubit
        BlocProvider<ProfileCubit>(
          create: (context) =>
              ProfileCubit(apiProfileRepository: apiProfileRepository),
        ),

        // Theme Cubit
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, currentTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: currentTheme,
            home: BlocConsumer<AuthCubit, AuthState>(
              builder: (context, authState) {
                // jika user terauthentikasi, munculkan Home Page
                if (authState is Authenticated) {
                  return const DashboardPage();
                }

                // jika user tidak terauthentikasi, munculkan Login Page
                if (authState is Unauthenticated) {
                  return const LoginPage();
                }
                // loading...
                else {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }
              },

              // error handling
              listener: (context, state) {
                if (state is AuthError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
