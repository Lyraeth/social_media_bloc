import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_bloc/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_bloc/features/dashboard/presentation/components/my_drawer_tile.dart';
import 'package:social_media_bloc/features/settings/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // Logout
  void _handleLogout() {
    final authCubit = context.read<AuthCubit>();
    authCubit.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      "More",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(color: Theme.of(context).colorScheme.primary),

              // List menu
              MyDrawerTile(
                title: "E-Cuti",
                leadingIcon: Icons.beach_access,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "E-Permit",
                leadingIcon: Icons.badge,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "E-Nilai",
                leadingIcon: Icons.grade,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "E-Jurnal",
                leadingIcon: Icons.book,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "E-Document",
                leadingIcon: Icons.insert_drive_file,
                onTap: () {},
              ),

              Divider(color: Theme.of(context).colorScheme.primary),

              MyDrawerTile(
                title: "Language",
                leadingIcon: Icons.language,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "Notification Settings",
                leadingIcon: Icons.notifications_active,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "Privacy Policy",
                leadingIcon: Icons.privacy_tip,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "Faq",
                leadingIcon: Icons.help_outline,
                onTap: () {},
              ),
              MyDrawerTile(
                title: "Legal Information",
                leadingIcon: Icons.gavel,
                onTap: () {},
              ),

              Divider(color: Theme.of(context).colorScheme.primary),

              MyDrawerTile(
                title: "Settings",
                leadingIcon: Icons.settings,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                ),
              ),

              const Spacer(),

              MyDrawerTile(
                title: "Logout",
                leadingIcon: Icons.logout,
                onTap: _handleLogout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
