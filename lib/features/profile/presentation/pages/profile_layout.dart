import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_bloc/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_bloc/features/dashboard/presentation/components/bottom_menu/my_bottom_navigation.dart';
import 'package:social_media_bloc/features/profile/presentation/pages/profile_page.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().currentUser;
    String? nis = user!.nis;
    // UI
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ProfilePage(nis: nis),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}
